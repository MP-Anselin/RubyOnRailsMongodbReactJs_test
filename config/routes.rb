Rails.application.routes.draw do
  resources :carts
  post "auth/login", to: "sessions#login"
  post "auth/signup", to: "sessions#signup"
  post "/auth/logout", to: "sessions#logout"

  get "users/user", to: "users#show"

  get "/product/:id", to: "products#show"
  get "/product/:code", to: "products#show_by_code"
  get "/products", to: "products#index"

  post "/cart/:code", to: "carts#create"
  post "/cart/product/add", to: "carts#add_product"
  post "/cart/product/remove", to: "carts#remove_product"
  get "/cart/products", to: "carts#get_current_cart_content"

  get "/promotion/:id", to: "promotions#show"
  get "/promotions", to: "promotions#index"

end
