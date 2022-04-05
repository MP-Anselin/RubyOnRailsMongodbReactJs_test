class CartsController < ApplicationController
  before_action :authentication
  before_action :set_cart, only: %i[ show, add_product ]

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
  # params id:string id of the cart to display
  # params code:string product code to add to the cart
  #
  # GET /carts/:id/add/:code

  def add_product
    render json: @cart_service.add_product(cart_params[:code])
  end

  private

  ##
  # Function to set the current cart
  #
  # Use callbacks to share common setup or constraints between actions.

  def set_cart
    @cart_service.cart = cart_params[:id]
  end

  def cart_params
    params.permit(:code, :id)
    params
  end

end
