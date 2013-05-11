class Listing < ActiveRecord::Base
  attr_accessible :product_id, :stock, :types, :price
  validates :product_id, presence:true
  belongs_to :product
  has_many :line_items
  validates :price, :types, presence:true
  validates :types, uniqueness: true

  def can_order? few
    if few.class.name == "String"
      few = few.to_i
    end

    return false if few <= 0
    return stock > few
  end
end
