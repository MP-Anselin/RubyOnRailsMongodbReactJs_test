class Promotion
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :product_id, type: String
end
