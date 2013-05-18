class Cart < ActiveRecord::Base
  attr_accessible :user_id

  validates :user_id, :user, presence: true

  belongs_to :user

  has_many :line_items, as: :referable
end
