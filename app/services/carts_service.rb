class CartsService < ApplicationService

  ##
  # initialize the product service from productsService which will execute user requests for CartsController.
  #

  def initialize
    @products_service = ProductsService.new
  end


  ##
  # Function to get Cart model class functions

  def model
    Cart
  end

  ##
  # Function to get cart by id
  #
  # params id:string id of the cart to find

  def cart=(id)
    @cart = Cart.find(id)
  end

  ##
  # Function to get current cart element

  def cart
    @cart
  end

  def create(code)
    @cart = Cart.new
    add_product(code)
    @cart.save
  end

  def add_product(code)
    product = @products_service.get_by_product_code(code)
    cart.products << product._id
    cart.amount += product.amount
    cart.update
  end

  private

  def promotion(cart)

  end
end