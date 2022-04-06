class CartsService < ApplicationService

  ##
  # initialize the product service from productsService which will execute user requests for CartsController.
  # initialize the user service from usersService which will execute user requests for CartsController.
  # initialize the promotion service from PromotionsService which will execute user requests for CartsController.
  #

  def initialize
    @products_service = ProductsService.new
    @users_service = UsersService.new
    @promotions_service = PromotionsService.new
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

  ##
  # Function to create current cart element
  #
  # params current_user:User current_user of user who creates the cart

  def create_cart(current_user)
    new_cart = Cart.new
    new_cart.user_id = current_user._id
    @users_service.update_cart(current_user, new_cart)
    new_cart.save
    new_cart
  end

  ##
  # Function to add product to cart
  #
  # params product_id:string product_id of the product to add

  def add_product(product_id, current_cart = nil )
    unless current_cart
      current_cart = @cart
    end
    current_cart.products << product_id
    current_cart.update
  end

  ##
  # Function to remove product to cart
  #
  # params product_id:string product_id of the product to remove

  def remove_product(product_id, current_cart = [] )
    unless current_cart
      current_cart = @cart
    end
    if current_cart.products.include?(product_id)
    current_cart.products.delete_at(current_cart.products.index product_id)
    end
    current_cart.update
  end

  def get_cart_price(products)
    buy_one_get_one_free = @promotions_service.buy_one_get_one_free(products)
    bulk_purchases = @promotions_service.bulk_purchases(products)
    addict = @promotions_service.addict(products)
    buy_one_get_one_free + bulk_purchases + addict
  end

  ##
  # Function to close current cart element

  def close_cart
    @cart.is_bought = true
    @cart.update
  end
end