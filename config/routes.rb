Rails.application.routes.draw do
  get "/", to: "search#index", as: "index"
  post "/", to: "search#search", as: "search"

  mount ActionCable.server => '/cable'
end
