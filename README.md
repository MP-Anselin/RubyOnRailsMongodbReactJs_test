# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Documentation
http://localhost:63343/RubyOnRailsMongodbReactJs_test/docs/#label-start+sever


### start sever

`rails s`

### Port 

http://127.0.0.1:3000


### Available routes

carts GET    /carts(.:format)                       carts#index

POST   /carts(.:format)                       carts#create

new_cart GET    /carts/new(.:format)                   carts#new<br>
edit_cart GET    /carts/:id/edit(.:format)              carts#edit<br>
cart GET    /carts/:id(.:format)                   carts#show<br>
PATCH  /carts/:id(.:format)                   carts#update<br>
PUT    /carts/:id(.:format)                   carts#update<br>
DELETE /carts/:id(.:format)                   carts#destroy<br>

auth_login POST   /auth/login(.:format)                  sessions#login<br>
auth_signup POST   /auth/signup(.:format)                 sessions#signup<br>
auth_logout POST   /auth/logout(.:format)                 sessions#logout<br>
users_user GET    /users/user(.:format)                  users#show<br>

GET    /product/:id(.:format)                 products#show<br>
GET    /product/:code(.:format)               products#show_by_code<br>
products GET    /products(.:format)                    products#index<br>

POST   /cart/:code(.:format)                  carts#create<br>
cart_product_add POST   /cart/product/add(.:format)            carts#add_product<br>
cart_product_remove POST   /cart/product/remove(.:format)         carts#remove_product<br>
cart_products GET    /cart/products(.:format)               carts#get_current_cart_content<br>

GET    /promotion/:id(.:format)               promotions#show<br>
promotions GET    /promotions(.:format)                  promotions#index<br>