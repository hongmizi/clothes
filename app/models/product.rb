class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title
  validates :description, :title, presence:true
  has_many :orders
  has_many :listings
end
