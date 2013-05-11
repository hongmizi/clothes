class LineItem < ActiveRecord::Base
  attr_accessible :referable_id, :referable_type, :price, :quantity, :listing_id
  validates :referable_id, :referable_type, presence:true
  validates :price, numericality:{greater_than_or_equal_to:0.01}
  validates :quantity, numericality:{greater_than_or_equal_to:1}
  belongs_to :referable, polymorphic:true
  belongs_to :listing
end
