import { applyMiddleware, createStore } from "redux"
import thunkMiddleware from "redux-thunk"
import createLogger from "redux-logger"
import reducer from "./reducers"

const loggerMiddleware = createLogger()

const configureStore = (preloadedState) => {
  return createStore(
    reducer,
    preloadedState,
    applyMiddleware(
      thunkMiddleware,
      loggerMiddleware
    )
  )
}

export default configureStore
