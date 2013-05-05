class Order < ActiveRecord::Base
  attr_accessible :address, :message, :quantity, :user_id
  validates :quantity, :user_id, :address, presence:true
  validates :quantity, numericality:{greater_than_or_equal_to:1}
  validates :price, numericality:{greater_than_or_equal_to:0.01}
  belongs_to :user
  belongs_to :cart
  has_many :line_items
end
