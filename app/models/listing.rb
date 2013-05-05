class Listing < ActiveRecord::Base
  attr_accessible :color, :product_id, :size, :stock
  validates :product_id, presence:true
  belongs_to :product
end
