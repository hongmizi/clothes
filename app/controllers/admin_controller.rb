class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin

  def show
    @users = User.all
    @designers = User.all.select { |user| user.has_role? :designer}
    @manufacturers = User.all.select { |user| user.has_role? :manufacturer}
    @designs = Design.all
    @products = Product.all
    @orders = Order.all

  end
  private
  def ensure_user_is_admin
    authorize! :manage, :all
  end
end
