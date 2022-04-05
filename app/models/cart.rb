class Cart
  include Mongoid::Document
  include Mongoid::Timestamps

  # field of the collection cart
  field :amount, type: Float, default: 0
  field :is_bought, type: Boolean, default: false
  field :products, type: Array, default: []
  field :user_id, type: String, default: nil

  #relaction of the table cart
  belongs_to :user
end
