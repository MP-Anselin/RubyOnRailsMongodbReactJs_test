class ProductsController < ApplicationController

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

  # Only allow a list of trusted parameters through.

  def product_params
    #    params.require(:product).permit(:code)
    params
  end
end
