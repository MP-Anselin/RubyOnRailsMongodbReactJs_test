class PromotionsService < ApplicationService

  ##
  # initialize the promotion service from productsService which will execute user requests for othersController.
  #

  def initialize
    @product_service = ProductsService.new
  end


  ##
  # Function to get Promotion model class functions

  def model
    Promotion
  end

  ##
  # Function to get promotion by id
  #
  # params id:string id of the cart to find

  def promotion=(id)
    @promotion = Promotion.find(id)
  end

  ##
  # Function to get current promotion element

  def promotion
    @promotion
  end

  def buy_one_get_one_free(cart_products)
    promo = Promotion.find_by(name: "buy_one_get_one_free")
    nbr_article = 0
    price = @product_service.find(promo._id)

    cart_products.each do |product|
      if promo.product_id == product._id
        nbr_article += 1
      end
    end

    nbr_article = (nbr_article && nbr_article % 2 == 1) ? (nbr_article -= 1) : nbr_article
    price *= (nbr_article / 2)
  end
end