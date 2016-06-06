Rails.application.routes.draw do
  get "/", to: "search#index", as: "index"
  post "/", to: "search#search", as: "search"
  get "/action_cable", to: "search#action_cable"

  mount ActionCable.server => '/cable'
end
