const {logger} = require("firebase-functions");
const {onDocumentCreated} = require("firebase-functions/v2/firestore");
const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");

initializeApp();

/**
 * Handles the timer for a newly created ride request in the instantRide subcollection,
 * managing driver assignments and reassignments.
 * @param {functions.firestore.Event} event - The event triggered by document creation.
 * @returns {Promise<void>} A promise that resolves when the operation is complete.
 */
exports.handleDriverRideRequestTimer = onDocumentCreated("ride_requests/{rideId}", async (event) => {
  const snap = event.data;
  const rideId = event.params.rideId;
  logger.log("Function triggered for rideId:", rideId);

  if (!rideId || typeof rideId !== "string" || rideId.trim() === "") {
    logger.error("Invalid rideId:", rideId);
    return null;
  }

  const rideData = snap.data();
  if (!rideData) {
    logger.error("No ride data found for rideId:", rideId);
    return null;
  }

  const isBidding = rideData.is_bidding === "1";
  if (isBidding) {
    logger.log("Bidding enabled, skipping for rideId:", rideId);
    return null;
  }

  let acceptTime = parseInt(rideData.driver_ride_request_accept_time || 3) * 1000;
  const rideRef = getFirestore().collection("ride_requests").doc(rideId.toString());
  let subRef = null;

  // Validate service and service_category
  if (!rideData.service || !rideData.service.service_type) {
    logger.error("Missing or invalid service.service_type for rideId:", rideId, "rideData:", JSON.stringify(rideData));
    return null;
  }

  if (rideData.service.service_type === "cab") {
    if (!rideData.service_category || !rideData.service_category.service_category_type) {
      logger.error("Missing or invalid service_category.service_category_type for rideId:", rideId, "rideData:", JSON.stringify(rideData));
      return null;
    }
    if (rideData.service_category.service_category_type === "rental") {
      acceptTime = parseInt(rideData.driver_amb_rent_ride_req_time || 3) * 1000;
      subRef = rideRef.collection("rental_requests").doc(rideId.toString());
    } else if (
      ["package", "ride", "intercity", "schedule"].includes(rideData.service_category.service_category_type)
    ) {
      acceptTime = parseInt(rideData.driver_ride_request_accept_time || 3) * 1000;
      subRef = rideRef.collection("instantRide").doc(rideId.toString());
    } else {
      logger.error(
        "Unknown service_category.service_category_type:",
        rideData.service_category.service_category_type,
        "for rideId:",
        rideId,
      );
      return null;
    }
  } else if (rideData.service.service_type === "parcel") {
    acceptTime = parseInt(rideData.driver_ride_request_accept_time || 3) * 1000;
    subRef = rideRef.collection("instantRide").doc(rideId.toString());
  } else {
    logger.error("Unknown service.service_type:", rideData.service.service_type, "for rideId:", rideId);
    return null;
  }

  if (!subRef) {
    logger.error("subRef is null, unable to proceed for rideId:", rideId, "rideData:", JSON.stringify(rideData));
    return null;
  }

  logger.log("Checking document at path:", subRef.path);
  let retryCount = 0;
  const maxRetries = 3;
  let subSnap = await subRef.get();
  while (!subSnap.exists && retryCount < maxRetries) {
    logger.warn("Document not found, retrying...", {rideId, path: subRef.path});
    await new Promise((resolve) => setTimeout(resolve, 1000));
    subSnap = await subRef.get();
    retryCount++;
  }

  if (!subSnap.exists) {
    logger.error("Document not found after retries for rideId:", rideId, "at path:", subRef.path);
    const allDocs = await rideRef.collection("instantRide").listDocuments();
    logger.log("Existing instantRide documents:", allDocs.map((doc) => doc.path));
    return null;
  }

  logger.log("subRef and rideRef:", {rideRef: rideRef.path, subRef: subRef.path, exists: subSnap.exists});
  let subData = subSnap.data();
  let currentDriverId = subData.current_driver_id;

  if (!currentDriverId) {
    logger.error("No current_driver_id found for rideId:", rideId, "subData:", JSON.stringify(subData));
    return null;
  }

  // eslint-disable-next-line no-constant-condition
  while (true) {
    const timerExpiresAt = Date.now() + acceptTime;
    await subRef.update({
      timer_expires_at: new Date(timerExpiresAt).toISOString(),
      status: subData.status || "pending",
    });

    await new Promise((resolve) => setTimeout(resolve, acceptTime));
    const updatedSubSnap = await subRef.get();
    subData = updatedSubSnap.data();
    if (subData.status === "accepted" || subData.status === "rejected") {
      logger.log("Ride request status changed to:", subData.status, "for rideId:", rideId);
      break;
    }

    if (subData.status === "pending") {
      const rejectedDriverIds = subData.rejected_driver_ids || [];
      if (!rejectedDriverIds.includes(currentDriverId)) {
        rejectedDriverIds.push(currentDriverId);
      }
      let eligibleDriverIds = subData.eligible_driver_ids || [];
      // Validate that eligible_driver_ids is an array
      if (!Array.isArray(eligibleDriverIds)) {
        logger.error(
          "eligible_driver_ids is not an array for rideId:",
          rideId,
          "value:",
          eligibleDriverIds,
          "type:",
          typeof eligibleDriverIds,
          "subData:",
          JSON.stringify(subData),
        );
        eligibleDriverIds = []; // Treat as empty array to continue safely
      }
      eligibleDriverIds = eligibleDriverIds.filter((item) => item !== currentDriverId);
      await subRef.update({
        rejected_driver_ids: rejectedDriverIds,
        eligible_driver_ids: eligibleDriverIds,
        current_driver_id: null,
      });

      await getFirestore()
        .collection("driver_ride_requests")
        .doc(currentDriverId.toString())
        .delete()
        .catch((error) => logger.error("Error removing assignment:", error));

      // Step 2: Pick next driver from eligible_driver_ids
      let nextDriverId = null;
      if (eligibleDriverIds.length > 0) {
        do {
          nextDriverId = eligibleDriverIds[Math.floor(Math.random() * eligibleDriverIds.length)];
          const driverRideRef = getFirestore().collection("driver_ride_requests").doc(nextDriverId.toString());
          const driverRideSnap = await driverRideRef.get();
          if (!driverRideSnap.exists) {
            await driverRideRef.set({
              ride_requests: [{id: rideId, driver_id: nextDriverId}],
            });
            await subRef.update({current_driver_id: nextDriverId});
            break;
          } else {
            const queueDriverIds = subData.queue_driver_id || [];
            if (!queueDriverIds.includes(nextDriverId)) {
              queueDriverIds.push(nextDriverId);
            }
            await subRef.update({queue_driver_id: queueDriverIds});
            eligibleDriverIds = eligibleDriverIds.filter((item) => item !== nextDriverId);
            await subRef.update({eligible_driver_ids: eligibleDriverIds});
            nextDriverId = null;
          }
        } while (eligibleDriverIds.length > 0);
      }

      // Step 3: If no eligible drivers, check queue_driver_ids
      if (!nextDriverId && subData.queue_driver_id && subData.queue_driver_id.length > 0) {
        if (!Array.isArray(subData.queue_driver_id)) {
          logger.error(
            "queue_driver_id is not an array for rideId:",
            rideId,
            "value:",
            subData.queue_driver_id,
            "type:",
            typeof subData.queue_driver_id,
            "subData:",
            JSON.stringify(subData),
          );
          subData.queue_driver_id = []; // Treat as empty array to continue safely
        }
        do {
          nextDriverId = subData.queue_driver_id.shift();
          const driverRideRef = getFirestore().collection("driver_ride_requests").doc(nextDriverId.toString());
          const driverRideSnap = await driverRideRef.get();
          if (!driverRideSnap.exists) {
            await driverRideRef.set({
              ride_requests: [{id: rideId, driver_id: nextDriverId}],
            });
            await subRef.update({current_driver_id: nextDriverId, queue_driver_id: subData.queue_driver_id});
            break;
          } else {
            rejectedDriverIds.push(nextDriverId);
            await subRef.update({rejected_driver_ids: rejectedDriverIds});
          }
        } while (subData.queue_driver_id.length > 0);
      }

      // Step 4: Check if all drivers are exhausted
      if (!nextDriverId) {
        if (eligibleDriverIds.length === 0 && (!subData.queue_driver_id || subData.queue_driver_id.length === 0)) {
          await subRef.update({status: "cancelled"});
          await rideRef.update({cancellation_reason: "System cancelled automatically."});
          logger.log("All drivers rejected, setting status to cancelled for rideId:", rideId);
          break;
        }
      } else {
        currentDriverId = nextDriverId;
        subData = (await subRef.get()).data(); // Refresh subData after update
      }
    }
  }
  return null;
});

exports.handleUserFindDriverTimer = onDocumentCreated("ride_requests/{rideId}", async (event) => {
  const snap = event.data;
  const rideId = event.params.rideId;
  logger.log("User find driver timer triggered for rideId:", rideId);

  if (!rideId || typeof rideId !== "string" || rideId.trim() === "") {
    logger.error("Invalid rideId:", rideId);
    return null;
  }

  const rideData = snap.data();
  const timeLimitMinutes = rideData.find_driver_time_limit || 3; // Default to 3 minutes
  const timeLimitMs = timeLimitMinutes * 60 * 1000; // Convert to milliseconds
  logger.log("Find driver time limit for rideId:", rideId, "is", timeLimitMinutes, "minutes");

  const rideRef = getFirestore().collection("ride_requests").doc(rideId.toString());
  // const subRef = rideRef.collection("instantRide").doc(rideId.toString());
  // const subSnap = await subRef.get();
  // if (!subSnap.exists) {
  //   logger.error("instantRide subcollection document not found for rideId:", rideId);
  //   return null;
  // }

  // Set initial timer expiration
  const timerExpiresAt = Date.now() + timeLimitMs;
  await rideRef.update({
    user_find_driver_timer_expires_at: new Date(timerExpiresAt).toISOString(),
  });

  // Start countdown
  await new Promise((resolve) => setTimeout(resolve, timeLimitMs));

  // Check ride status after timer expires
  const rideRequestRef = await rideRef.get();
  if (!rideRequestRef.exists) {
    logger.log(`Ride ${rideId} no longer exists`);
    return null;
  }

  const subData = rideRequestRef.data();
  const status = subData.status || "pending";
  const currentDriverId = subData.current_driver_id;

  if (status === "pending") {
    await rideRef.update({
      status: "cancelled",
      cancelled_at: new Date().toISOString(),
      cancellation_reason: "No driver assigned within user find driver time limit",
    });
    logger.log(`Ride ${rideId} cancelled due to no driver assigned within time limit`);
  } else {
    logger.log(`Ride ${rideId} not cancelled: status=${status}, driverId=${currentDriverId}`);
    await rideRef.update({
      status: "close",
      cancelled_at: new Date().toISOString(),
      cancellation_reason: "CLOSE FOR TESTING",
    });
  }

  return null;
});
