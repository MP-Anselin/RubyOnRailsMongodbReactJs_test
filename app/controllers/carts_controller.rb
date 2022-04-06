class CartsController < ApplicationController
  before_action :authentication

  ##
  # initialize the cart service from JobsService class which will execute the requests of CartsController
  #

  def initialize
    @cart_service = CartsService.new
  end

  ##
  # Function to analyze the request show cart content
  #
  # params id:string id of the cart to display
  #
  # GET /carts/:id

  def show
    render json: @cart_service.cart
  end

  ##
  # Function to add product in the cart
  #
  # params product_id:string product_id of the product to add
  #
  # POST /carts/product/add

  def add_product
    @cart_service.add_product(cart_params[:product_id], set_current_cart)
    render json: current_user.carts
  end

  ##
  # Function to get the content of the current user current cart
  #
  #
  # GET /carts/products

  def get_current_cart_content
    data = {}
    data["price"] = @cart_service.get_cart_price(set_current_cart.products)
    data["products"] = set_current_cart.products
    render json: data
  end

  ##
  # Function to remove product in the cart
  #
  # params product_id:string product_id of the product to remove
  #
  # POST /carts/product/remove

  def remove_product
    @cart_service.remove_product(cart_params[:product_id], set_current_cart)
    render json: current_user.carts
  end

  ##
  # Function close the cart shopping
  #
  # params id:string id of the cart to close
  #
  # GET /carts/:id/close

  def close_cart
    render json: @cart_service.close_cart
  end

  private

  def set_current_cart
    user_carts = current_user.carts
    save_cart = nil
    if user_carts
      user_carts.each do |cart|
        if cart.is_bought == false
          save_cart = cart
          break
        end
      end
    end

    !save_cart ? @cart_service.create_cart(current_user) : save_cart
  end

  def cart_params
    params
  end

end
