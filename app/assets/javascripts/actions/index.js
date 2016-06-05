import { QUERY, ADD_TWEET } from "../constants/ActionTypes"

let nextTweetId = 0

export const query = (query) => {
  App.sanzu.speak(query)
  return {
    type: QUERY,
    query
  }
}

export const addTweet = (tweet) => {
  return {
    type: ADD_TWEET,
    tweet: Object.assign(tweet, { id: nextTweetId++ })
  }
}
