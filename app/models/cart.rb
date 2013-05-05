class Cart < ActiveRecord::Base
  attr_accessible :user_id
  validates :user_id, presence: true
  belongs_to :user
  has_many :orders
end
