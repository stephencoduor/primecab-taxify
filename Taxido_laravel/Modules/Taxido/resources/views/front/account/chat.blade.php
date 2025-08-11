@extends('taxido::front.account.master')
@section('title', __('taxido::front.support'))
@section('detailBox')
  <div class="dashboard-details-box">
    <div class="dashboard-title">
      <h3>{{ __('taxido::front.chat') }}</h3>
    </div>
    <div class="chatting-main-box">
      <div class="right-sidebar-chat">
        <div class="contentbox">
          <div class="inside">
            <div class="right-sidebar-title">
              <div class="common-space">
                <div class="chat-time-chat">
                  <div class="chat-top-box">
                    <div class="chat-profile">
                      <div id="receiverAvatarContainer">
                        @if ($admin?->profile_image?->original_url)
                            <img class="img-fluid rounded-circle" id="receiverAvatar"
                                src="{{ $admin->profile_image->original_url }}" alt="admin">
                        @else
                            <div class="user-round message-profile">
                                <span>{{ strtoupper($admin?->name[0]) }}</span>
                            </div>
                        @endif
                      </div>
                      <div id="receiverStatusDot"></div>
                    </div>
                    <div>
                      <h5 id="receiverName">{{ $admin?->name ?? 'Admin' }}</h5>
                    </div>
                    <div class="chatting-option">
                      <a href="javascript:void(0)" id="clearChat" data-bs-toggle="modal"
                          data-bs-target="#confirmation">
                          <i class="ri-brush-line"></i>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="right-sidebar-Chats">
              <div class="message">
                <div class="msger-chat custom-scrollbar" id="messages">
                  <div id="loading">
                    <i class="fa fa-spinner fa-spin"></i>
                    {{ __('taxido::static.chats.load_message') }}
                  </div>
                  <div id="noMessages" class="no-chat-message">
                    <span>{{ __('taxido::static.chats.no_messages_yet') }}</span>
                  </div>
                  <div id="error"></div>
                </div>
                <form class="msger-inputarea">
                  <div class="position-relative">
                    <input class="msger-input" type="text" id="message" placeholder="{{ __('taxido::front.type_message') }}">
                    <i class="ri-error-warning-line msger-input-error-icon"></i>
                    <button class="msger-send-btn" type="button" id="send">
                      <i class="ri-send-plane-line"></i>
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
   <!-- Confirmation Modal -->
   <div class="modal theme-modal fade confirmation-modal" id="confirmation" tabindex="-1" role="dialog"
    aria-labelledby="confirmationLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-body text-start confirmation-data">
              <div class="main-img">
                  <div class="delete-icon">
                      <i class="ri-question-mark"></i>
                  </div>
              </div>
              <h4 class="modal-title">{{ __('taxido::static.chats.confirmation') }}</h4>
              <p>{{ __('taxido::static.chats.modal') }}</p>
            </div>
            <div class="modal-footer">
              <input type="hidden" id="inputType" name="type" value="">
              <button type="button" class="btn cancel-btn" data-bs-dismiss="modal">No</button>
              <button type="button" class="btn gradient-bg-color" id="confirmDelete">Yes</button>
            </div>
        </div>
    </div>
  </div>
@endsection

@push('scripts')
<script src="{{ asset('js/firebase/firebase-app-compat.js')}}"></script>
<script src="{{ asset('js/firebase/firebase-firestore-compat.js')}}"></script>
<script>
  // Firebase configuration
  const firebaseConfig = {
    apiKey: "{{ env('FIREBASE_API_KEY') }}",
    authDomain: "{{ env('FIREBASE_AUTH_DOMAIN') }}",
    projectId: "{{ env('FIREBASE_PROJECT_ID') }}",
    storageBucket: "{{ env('FIREBASE_STORAGE_BUCKET') }}",
    messagingSenderId: "{{ env('FIREBASE_MESSAGING_SENDER_ID') }}",
    appId: "{{ env('FIREBASE_APP_ID') }}",
    measurementId: "{{ env('FIREBASE_MEASUREMENT_ID') }}"
  };

  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  const db = firebase.firestore();
  let unsubscribeMessages = null;

  const myUserId = String("{{ auth()->user()?->id }}");
  const myUserName = "{{ auth()->user()?->name }}";
  const myUserImage = "{{ auth()->user()?->profile_image?->original_url ?? '' }}";
  const adminId = String("{{ $admin?->id }}");
  const adminName = "{{ $admin?->name ?? 'Admin' }}";
  const adminImage = "{{ $admin?->profile_image?->original_url ?? '' }}";
  const currentChatRoomId = [myUserId, adminId].sort().join('_');
  let renderedMessageIds = new Set(); // Track rendered message IDs to prevent duplicates

  function formatTime(timestamp) {
    const date = timestamp?.toDate ? timestamp.toDate() : new Date(timestamp);
    return date.toLocaleTimeString([], {
      hour: '2-digit',
      minute: '2-digit'
    });
  }

  function loadMessages() {
    $('#loading').show();
    $('#noMessages').hide();
    $('#messages').empty();
    renderedMessageIds.clear(); // Clear tracked message IDs on load

    // Check if the chat is cleared by the user
    db.collection('chats').doc(currentChatRoomId).get()
        .then((doc) => {
            const isCleared = doc.exists && doc.data().clearedBy && doc.data().clearedBy.includes(myUserId);
            const clearTimestamp = doc.exists && doc.data().clearTimestamp && doc.data().clearTimestamp[myUserId];

            // Initialize chat document
            db.collection('chats').doc(currentChatRoomId).set({
                participants: [myUserId, adminId],
                unreadCount: {
                    [myUserId]: 0,
                    [adminId]: 0
                },
                clearedBy: doc.exists && doc.data().clearedBy ? doc.data().clearedBy : [],
                clearTimestamp: doc.exists && doc.data().clearTimestamp ? doc.data().clearTimestamp : {}
            }, { merge: true });

            // Attach message listener with cleared state and timestamp
            attachMessageListener(isCleared, clearTimestamp);
        })
        .catch((error) => {
            $('#loading').hide();
            $('#error').text('Error checking chat status').show();
            console.error('Error checking chat status:', error);
        });
  }

  function attachMessageListener(isCleared, clearTimestamp) {
    if (unsubscribeMessages) {
        unsubscribeMessages();
        unsubscribeMessages = null;
    }

    unsubscribeMessages = db.collection('chats').doc(currentChatRoomId)
        .collection('messages')
        .orderBy('timestamp', 'asc')
        .onSnapshot((snapshot) => {
            $('#loading').hide();
            let hasMessages = false;

            snapshot.docChanges().forEach((change) => {
                const msg = change.doc.data();
                const messageId = change.doc.id;

                // Skip messages already rendered
                if (renderedMessageIds.has(messageId)) {
                    return;
                }

                // Filter messages based on clearTimestamp if chat is cleared
                if (isCleared && clearTimestamp && msg.timestamp && msg.timestamp.toMillis() <= clearTimestamp.toMillis()) {
                    return; // Skip messages before or at clearTimestamp
                }

                if (change.type === 'added') {
                    appendMessage(messageId, msg);
                    renderedMessageIds.add(messageId); // Track rendered message
                    hasMessages = true;
                } else if (change.type === 'modified') {
                    updateMessage(messageId, msg);
                    hasMessages = true;
                } else if (change.type === 'removed') {
                    removeMessage(messageId);
                    renderedMessageIds.delete(messageId); // Remove from tracking
                }
            });

            // Update UI based on whether any messages were displayed
            if (!hasMessages && isCleared) {
                $('#noMessages').show();
            } else {
                $('#noMessages').hide();
            }

            // Update unread count
            db.collection('chats').doc(currentChatRoomId).set({
                unreadCount: { [myUserId]: 0 }
            }, { merge: true });

            $('#messages').scrollTop($('#messages')[0].scrollHeight);
        }, (error) => {
            $('#loading').hide();
            $('#error').text('Error loading messages').show();
            console.error('Error loading messages:', error);
        });
  }

  function appendMessage(messageId, msg) {
    const isMe = msg.senderId === myUserId;
    const bubbleClass = isMe ? 'admin-reply' : 'user-reply';
    const imageSrc = isMe ? myUserImage : adminImage;
    const imageHtml = imageSrc ?
      `<img src="${imageSrc}" class="message-profile img-fluid" alt="">` :
      `<div class="user-round message-profile"><h6>${isMe ? myUserName[0].toUpperCase() : adminName[0].toUpperCase()}</h6></div>`;

    const html = `
      <div class="${bubbleClass}" id="msg-${messageId}">
        ${imageHtml}
        <div class="chatting-box">
          <p>${msg.message}</p>
          <h6 class="timing">${msg.timestamp ? formatTime(msg.timestamp) : 'Sending...'}</h6>
        </div>
      </div>
    `;
    $('#messages').append(html);
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }

  function updateMessage(messageId, msg) {
    const el = $('#msg-' + messageId);
    if (el.length) {
        const isMe = msg.senderId === myUserId;
        const bubbleClass = isMe ? 'admin-reply' : 'user-reply';
        const imageSrc = isMe ? myUserImage : adminImage;
        const imageHtml = imageSrc ?
            `<img src="${imageSrc}" class="message-profile img-fluid" alt="">` :
            `<div class="user-round message-profile"><h6>${isMe ? myUserName[0].toUpperCase() : adminName[0].toUpperCase()}</h6></div>`;

        el.html(`
            <div class="${bubbleClass}" id="msg-${messageId}">
                ${imageHtml}
                <div class="chatting-box">
                    <p>${msg.message}</p>
                    <h6 class="timing">${msg.timestamp ? formatTime(msg.timestamp) : 'Sending...'}</h6>
                </div>
            </div>
        `);
    }
  }

  function removeMessage(messageId) {
    $('#msg-' + messageId).remove();
  }

  $('#send').on('click', function() {
    const $messageInput = $('#message');
    const messageText = $messageInput.val().trim();

    if (!messageText) {
      $messageInput.addClass('error');
      return;
    }
    $messageInput.removeClass('error');

    const messageData = {
        senderId: myUserId,
        senderName: myUserName,
        receiverName: adminName,
        message: messageText,
        timestamp: firebase.firestore.FieldValue.serverTimestamp()
    };

    // Send message and update chat document
    db.collection('chats').doc(currentChatRoomId).collection('messages').add(messageData)
        .then((docRef) => {
            db.collection('chats').doc(currentChatRoomId).set({
                participants: [myUserId, adminId],
                lastMessage: messageData,
                unreadCount: {
                    [adminId]: firebase.firestore.FieldValue.increment(1),
                    [myUserId]: 0
                }
            }, { merge: true });
            $messageInput.val('');
            // Do not reattach listener here; rely on existing listener
        })
        .catch((error) => {
            console.error('Error sending message:', error);
            $('#error').text('Failed to send message').show();
        });
  });

  $('#confirmDelete').on('click', function() {
    if (!currentChatRoomId) {
        $('#confirmation').modal('hide');
        return;
    }
    $(this).append('<span class="spinner-border spinner-border-sm ms-2 spinner_loader"></span>');

    // Mark chat as cleared for the user with a timestamp
    db.collection('chats').doc(currentChatRoomId).set({
        clearedBy: firebase.firestore.FieldValue.arrayUnion(myUserId),
        clearTimestamp: {
            [myUserId]: firebase.firestore.FieldValue.serverTimestamp()
        },
        unreadCount: {
            [myUserId]: 0,
            [adminId]: firebase.firestore.FieldValue.increment(0)
        }
    }, { merge: true })
    .then(() => {
        $('#messages').empty();
        $('#noMessages').show();
        renderedMessageIds.clear(); // Clear tracked message IDs
        if (unsubscribeMessages) {
            unsubscribeMessages();
            unsubscribeMessages = null;
        }
        $('#confirmation').modal('hide');
        $('.spinner_loader').remove();
        // Reattach listener with cleared state
        db.collection('chats').doc(currentChatRoomId).get()
            .then((doc) => {
                const isCleared = doc.exists && doc.data().clearedBy && doc.data().clearedBy.includes(myUserId);
                const clearTimestamp = doc.exists && doc.data().clearTimestamp && doc.data().clearTimestamp[myUserId];
                attachMessageListener(isCleared, clearTimestamp);
            });
    })
    .catch((error) => {
        console.error('Error clearing chat:', error);
        $('#error').text('Failed to clear chat').show();
        $('#confirmation').modal('hide');
        $('.spinner_loader').remove();
    });
  });

  $(document).ready(function() {
    // Initialize chat document
    db.collection('chats').doc(currentChatRoomId).set({
        participants: [myUserId, adminId],
        unreadCount: {
            [myUserId]: 0,
            [adminId]: 0
        }
    }, { merge: true });

    loadMessages();

    $('#message').on('keypress', function(e) {
        if (e.which === 13) {
            $('#send').click();
            return false;
        }
    });

    db.collection('users').doc(myUserId).set({
        lastActive: firebase.firestore.FieldValue.serverTimestamp()
    }, { merge: true });

    setInterval(() => {
        db.collection('users').doc(myUserId).set({
            lastActive: firebase.firestore.FieldValue.serverTimestamp()
        }, { merge: true });
    }, 30000);
  });
</script>
@endpush
