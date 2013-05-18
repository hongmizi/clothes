class Listing < ActiveRecord::Base
  attr_accessible :product_id, :stock, :types, :price

  validates :product_id, :product, :types, :price, presence:true
  validates :price, :types, presence:true
  validates :types, uniqueness: true

  belongs_to :product
  has_many :line_items

  def can_order? number
    number = number.to_i
    return  number > 0 && stock > number
  end
end
