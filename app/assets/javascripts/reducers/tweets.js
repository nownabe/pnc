import { ADD_TWEET } from "../constants/ActionTypes"

const tweets = (tweets = [], action) => {
  switch (action.type) {
    case ADD_TWEET:
      return [
        ...tweets,
        action.tweet
      ]
    default:
      return tweets
  }
}

export default tweets
