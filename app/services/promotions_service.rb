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


  ##
  # Function to get the price of the products after reduction
  #
  # parms cart_products:array cart_products is the shopping cart of the current user

  def buy_one_get_one_free(cart_products)
    promo = Promotion.find_by(name: "buy-one-get-one-free")
    nbr_article = 0
    price = @product_service.model.find_by(_id: promo.product_id).price

    cart_products.each do |product|
      if promo.product_id == product
        nbr_article += 1
      end
    end

    if nbr_article < 2
      return price *= nbr_article
    end
    add = 0
    if (nbr_article % 2) == 1
      nbr_article -= 1
      add = price
    end
    (price *= (nbr_article / 2)) + add
  end

  ##
  # Function to get the price of the products after reduction
  #
  # parms cart_products:array cart_products is the shopping cart of the current user

  def bulk_purchases(cart_products)
    promo = Promotion.find_by(name: "bulk-purchases")
    nbr_article = 0
    price = @product_service.model.find_by(_id: promo.product_id).price

    cart_products.each do |product|
      if promo.product_id == product
        nbr_article += 1
      end
    end

    price = nbr_article > 2 ? 4.50 : price
    price *= nbr_article
  end

  ##
  # Function to get the price of the products after reduction
  #
  # parms cart_products:array cart_products is the shopping cart of the current user

  def addict(cart_products)
    promo = Promotion.find_by(name: "addict")
    nbr_article = 0
    price = @product_service.model.find_by(_id: promo.product_id).price

    cart_products.each do |product|
      if promo.product_id == product
        nbr_article += 1
      end
    end

    price = nbr_article > 2 ? (2.to_f/3.to_f).to_f * price/1 : price
    price *= nbr_article
  end
end