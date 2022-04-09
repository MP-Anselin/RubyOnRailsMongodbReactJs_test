class PromotionsController < ApplicationController
  before_action :authentication
  before_action :set_promotion, only: %i[ index show ]

  ##
  # initialize the promotion service from promotionsService which will execute user requests for promotionController.
  #

  def initialize
    @promotion_service = PromotionsService.new
  end

  ##
  # show content of one promotion
  # params id of the promotion to return
  # GET /promotion/:id
  #

  def show
    render json: @promotion_service.model.find(promotion_params[:id])
  end

  ##
  # Function to analyze the request get all promotion
  #
  # GET /promotion

  def index
    render json: @promotion_service.model.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_promotion
    if params[:id]
      @promotion = Promotion.find(params[:id])
    end
  end

  # Only allow a list of trusted parameters through.

  def promotion_params
    params
  end
end
