class Product < ActiveRecord::Base
  attr_accessible :description, :title, :image_url

  validates :description, :title, :image_url, presence:true

  has_many :orders
  has_many :listings, dependent: :destroy

  accepts_nested_attributes_for :listings

  def update_image image
    path = Rails.root.join('public', 'uploads', 'products_image')
    FileUtils.mkdir_p(path) unless File.exists?(path)

    File.open(path + @product.id.to_s, 'wb') do |file|
      file.write(image.read)
    end

    image_url = "/uploads/products_image/#{@product.id}"
  end
end
