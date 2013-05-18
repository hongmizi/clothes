class User < ActiveRecord::Base
  include RoleModel
  roles :admin, :designer, :manufacturer, :visitor

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :designs
  has_one :manufacturer
  has_many :orders
  has_one :cart

  scope :designers, select { |user| user.has_role? :designer}
  scope :manufacturers, select { |user| user.has_role? :manufacturer}

end
