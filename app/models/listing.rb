class Listing < ActiveRecord::Base
  attr_accessible :color, :product_id, :size, :stock
  validates :product_id, presence:true
  belongs_to :product
  belongs_to :line_item

  def can_order? few
    return false if few <= 0
    return stock > few
  end
end
