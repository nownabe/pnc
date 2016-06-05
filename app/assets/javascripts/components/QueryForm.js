import React from "react"
import { connect } from "react-redux"
import { query } from "../actions"

let QueryForm = ({ dispatch }) => {
  let input

  return (
    <div id="search-form">
      <form
        onSubmit={e => {
          e.preventDefault()
          if (!input.value.trim())
            return
          dispatch(query(input.value))
          input.value = ""
        }}
      >
        <div className="control has-addons">
          <input
            className="input is-large"
            placeholder="Search Query"
            ref={node => {
              input = node
            }}
          />
          <button type="submit" className="button is-primary is-large">
            Analyze
          </button>
        </div>
      </form>
    </div>
  )
}

QueryForm = connect()(QueryForm)

export default QueryForm
