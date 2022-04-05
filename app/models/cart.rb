class Cart
  include Mongoid::Document
  include Mongoid::Timestamps

  # field of the collection cart
  field :amount, type: Float, default: 0
  field :status, type: Boolean, default: false
  field :products, type: Array, default: []

=begin
  #relaction of the table cart
  belongs_to :user
=end
end
