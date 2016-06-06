import { ADD_TWEET, QUERY } from "../constants/ActionTypes"

const tweets = (tweets = [], action) => {
  switch (action.type) {
    case ADD_TWEET:
      return [
        ...tweets,
        action.tweet
      ]
    case QUERY:
      return []
    default:
      return tweets
  }
}

export default tweets
