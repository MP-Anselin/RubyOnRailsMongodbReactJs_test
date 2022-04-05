class ProductsService < ApplicationService

  ##
  # Function to get Product model class functions

  def model
    Product
  end

  def product=(code)
    @product = get_by_product_code(code)
  end

  ##
  # Function to get current Job element

  def product
    @product
  end

  ##
  # Function to execute request, find product by product code
  #
  # params code:string email of the code to find

  def get_by_product_code(code)
    Product.find_by(product_code: code)
  end
end