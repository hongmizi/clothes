class Manufacturer < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  validates :description, :name, :user

  belongs_to :user
end
