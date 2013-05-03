# coding: UTF-8
class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    if not current_user.has_role? :admin
      redirect_to user_path(current_user.id), alert:"你没有权限访问此页面" and return
    end
    @users = User.all
    @designers = User.all.select { |user| user.has_role? :designer}
    @manufacturers = User.all.select { |user| user.has_role? :manufacturer}
  end
  def show
  end
  def admin
    if not current_user.has_role? :admin
      redirect_to user_path(current_user.id), alert:"你没有权限访问此页面" and return
    end
    @users = User.all
    @designers = User.all.select { |user| user.has_role? :designer}
    @manufacturers = User.all.select { |user| user.has_role? :manufacturer}
    @designs = Design.all
    @products = Product.all
    @orders = Order.all
  end

  def designer
    if not current_user.has_role? :designer
      redirect_to user_path(current_user.id), alert:"你没有权限访问此页面" and return
    end
    @designs = current_user.designs
  end

  def manufacturer
    if not current_user.has_role? :manufacturer
      redirect_to user_path(current_user.id), alert:"你没有权限访问此页面" and return
    end
  end
end
