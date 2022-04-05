class ProductsController < ApplicationController
  before_action :authentication
  before_action :set_product, only: %i[ index show show_by_code]

  ##
  # initialize the product service from productsService class which will execute the requests of ProductsController
  #

  def initialize
    @product_service = ProductsService.new
  end

  # GET /product/:id
  def show
    render json: @product_service.model.find(product_params[:id])
  end


  # GET /product/:code
  def show_by_code
    @product_service.product = product_params[:code]
    render json: @product_service.product
  end

  ##
  # Function to analyze the request get all product
  #
  # GET /products

  def index
    render json: @product_service.model.all
  end

  private

  ##
  # Function to set the current products
  #
  # Use callbacks to share common setup or constraints between actions.

  def set_product
    @product_service.product = product_params[:id]
  end

  # Only allow a list of trusted parameters through.

  def product_params
    #    params.require(:product).permit(:code)
    params
  end
end
