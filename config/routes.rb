Rails.application.routes.draw do
  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"
  post "/logout", to: "sessions#logout"

  get "/product/:code", to: "products#show"
  post "/cart/:code", to: "carts#create"
  post "/cart/add/product", to: "carts#add_product"
end
