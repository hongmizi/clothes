class Product < ActiveRecord::Base
  attr_accessible :description, :title, :image_url

  validates :description, :title, :image_url, presence:true

  has_many :orders
  has_many :listings, dependent: :destroy

  accepts_nested_attributes_for :listings

  def update_image image
    path = Rails.root.join('public', 'uploads', 'products_image')
    FileUtils.mkdir_p(path) unless File.exists?(path)

    file_name =Time.now.to_i.to_s
    File.open(path + file_name, 'wb') do |file|
      file.write(image.read)
    end

    self.image_url = "/uploads/products_image/#{file_name}"
  end
end
