class Product < ActiveRecord::Base
  attr_accessible :description, :title, :image_url
  validates :description, :title, presence:true
  has_many :orders
  has_many :listings, dependent: :destroy
  validates :image_url, format:{
    with:%r{\.(gif|jpg|bmp|png)$}i,
    message:"must be a URL for GIF,JPG,BMP or PNG image!"
  }
  accepts_nested_attributes_for :listings
end
