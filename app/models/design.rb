class Design < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  validates :description, :name, presence:true
  belongs_to :user
end
