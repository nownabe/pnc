import React from "react"
import QueryForm from "./QueryForm"
import Query from "./Query"
import Graph from "./Graph"
import TweetList from "./TweetList"

const Root = () => (
  <div>
    <QueryForm />
    <Query />
    <div className="columns is-mobile">
      <Graph />
      <TweetList />
    </div>
  </div>
)

export default Root
