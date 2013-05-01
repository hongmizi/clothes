class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title
  validates :description, :title, presence:true
  validates :price, numericality:{greater_than_or_equal_to:0.01}
end
