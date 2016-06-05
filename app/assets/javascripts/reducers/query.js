import { QUERY } from "../constants/ActionTypes"

const query = (query = "", action) => {
  switch (action.type) {
    case QUERY:
      return action.query
    default:
      return query
  }
}

export default query
