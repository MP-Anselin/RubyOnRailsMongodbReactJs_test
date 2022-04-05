class UsersService < ApplicationService

  ##
  # Function to get User model class functions
  def model
    User
  end

  ##
  # Function to execute request, find user by email
  #
  # params email:string email of the user to find

  def get_by_email(email)
    User.find_by(email: email)
  end

  ##
  # Function to execute request, find user by id
  #
  # params id:string id of the user to find

  def get_by_id(id)
    User.find_by(id: id)
  end

  ##
  # Function to execute request, create job, we store which job the user created
  #
  # params current_user:User current_user is a intense of the user is added product in cart
  # params cart:Cart cart is a intense of the cart
  #

  def update_cart(current_user, cart)
    current_user.carts << cart
    puts "update_cart: current_user ==> ", current_user.carts.inspect
  end
end