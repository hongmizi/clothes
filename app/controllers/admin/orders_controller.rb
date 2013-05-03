class Admin::OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
  end

  private
  def ensure_user_is_admin
    authorize! :manage, :all
  end
end
