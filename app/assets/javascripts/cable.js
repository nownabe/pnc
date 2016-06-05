//= require action_cable
//= require_self
//= require_tree ./channels

//import App from "./components/App"

(function() {
  this.App || (this.App = {})
  App.cable = ActionCable.createConsumer()
  App.store = store
}).call(this)
