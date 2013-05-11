class Product < ActiveRecord::Base
  attr_accessible :description, :title, :image_url
  validates :description, :title, presence:true
  has_many :orders
  has_many :listings, dependent: :destroy
  accepts_nested_attributes_for :listings
end
