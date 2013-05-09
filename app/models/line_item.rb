class LineItem < ActiveRecord::Base
  attr_accessible :listing_id, :order_id, :price, :quantity
  validates :listing_id, :order_id, presence:true
  validates :price, numericality:{greater_than_or_equal_to:0.01}
  validates :quantity, numericality:{greater_than_or_equal_to:1}
  belongs_to :referable, polymorphic:true
  belongs_to :listing
end
