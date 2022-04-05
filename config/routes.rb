Rails.application.routes.draw do
  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"
  post "/logout", to: "sessions#logout"

  get "/product/:code", to: "products#show"
end
