class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :product_code, type: String
  field :name, type: String
  field :price, type: Float
end
