import React from "react"
import { render } from "react-dom"
import { Provider } from "react-redux"
import configureStore from "./configureStore"
import { createStore } from "redux"
import Root from "./components/Root"

let store = configureStore()
window.store = store

render(
  <Provider store={store}>
    <Root />
  </Provider>,
  document.getElementById("app")
)
