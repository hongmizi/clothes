class Manage::AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin
  def show
    @users = User.all
    @designs = Design.all
  end

  def ensure_user_is_admin
    authorize! :manage, :all
  end
end
