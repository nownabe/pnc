Rails.application.routes.draw do
  get "/", to: "search#index", as: "index"
  post "/", to: "search#search", as: "search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
