import { combineReducers } from "redux"
import tweets from "./tweets"
import query from "./query"

const reducer = combineReducers({
  tweets,
  query
})

export default reducer
