class ProductsController < ApplicationController
  before_action :authentication
  before_action :set_product, only: %i[ show]

  ##
  # initialize the product service from productsService class which will execute the requests of ProductsController
  #

  def initialize
    @product_service = ProductsService.new
  end


  # GET /product/:code
  def show
    @product_service.product = product_params[:code]
    render json: @product_service.product
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
