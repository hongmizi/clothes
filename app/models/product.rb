class Product < ActiveRecord::Base
  attr_accessible :description, :title
  validates :description, :title, presence:true
  has_many :orders
  has_many :listings
  validates :image_url, format:{
    with:%r{\.(gif|jpg|bmp|png)$}i,
    message:"must be a URL for GIF,JPG,BMP or PNG image!"
  }
end
