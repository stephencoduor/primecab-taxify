import { dashBoard } from '../endpoints/dashboardEndPoint'
import { GET_API } from '../methods'

export const dashBoardData = async ({
  unit,
  zoneId,
}: {
  unit: string
  zoneId: number
}) => {
  return GET_API(`${dashBoard}?unit=${unit}&zoneId=${zoneId}`)
    .then(res => {
      return res
    })
    .catch(e => {
      return e?.response
    })
}
const dashBoardService = {
  dashBoardData,
}

export default dashBoardService
