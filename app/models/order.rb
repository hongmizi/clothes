class Order < ActiveRecord::Base
  attr_accessible :address, :message, :product_id, :quantity, :user_id
  validates :product_id, :quantity, :user_id, :address, presence:true
  validates :quantity, numericality:{greater_than_or_equal_to:1}
  belongs_to :user
  belongs_to :product
end
