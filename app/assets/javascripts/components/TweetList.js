import React from "react"
import { connect } from "react-redux"
import Tweet from "./Tweet"

let TweetList = ({ tweets }) => (
  <div id="tweets" className="column is-three-quaters">
    {tweets.map(tweet =>
      <Tweet key={tweet.id} {...tweet} />
    )}
  </div>
)

const mapStateToProps = (state, ownProps) => {
  return { tweets: state.tweets }
}

const mapDispatchToProps = (dispatch, ownProps) => ({})

TweetList = connect(
  mapStateToProps,
  mapDispatchToProps
)(TweetList)

export default TweetList
