import React from "react"
import { connect } from "react-redux"
import { query } from "../actions"

const mapStateToProps = (state, ownProps) => {
  return { query: state.query }
}

const mapDispatchToProps = (dispatch, ownProps) => ({})

const TextLabel = ({ query }) => (
  <span>{ query }</span>
)

const Query = connect(
  mapStateToProps,
  mapDispatchToProps
)(TextLabel)

export default Query
