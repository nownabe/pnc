import { addTweet } from "../actions"

App.sanzu = App.cable.subscriptions.create("SanzuChannel", {
	connected: function() {},
	disconnected: function() {},
	received: (data) => {
    console.log("App.sanzu.received: ")
    console.log(data)
		App.store.dispatch(addTweet(data.tweet))
	},
	speak: function(message) {
		this.perform("speak", { message })
	},
  analyze: function(query) {
    this.perform("analyze", { query })
  }
})
