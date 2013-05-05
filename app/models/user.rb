class User < ActiveRecord::Base
  include RoleModel
  roles :admin, :designer, :manufacturer, :visitor
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :designs
  has_one :manufacturer
  has_many :orders
  has_one :cart
end
