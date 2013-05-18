class Order < ActiveRecord::Base
  attr_accessible :address, :user_id

  validates :user_id, :address, :user, presence:true
  validates :price, numericality:{greater_than_or_equal_to:0.01}

  belongs_to :user
  has_many :line_items, as: :referable
end
