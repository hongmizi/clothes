class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin

  def index
    @users = User.all
    @designers = User.designers
    @manufacturers = User.manufacturers
  end

  def show
    @user = User.find params[:id]
  end

  private
  def ensure_user_is_admin
    authorize! :manage, :all
  end
end
