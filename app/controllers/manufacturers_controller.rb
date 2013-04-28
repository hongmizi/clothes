class ManufacturersController < ApplicationController
  before_filter :authentication_user!
  before_filter :authenrize

  def index
  end

  def new
  end

  def create
    @user = User.find(params[:id])
    @user.roles << :manufacturer
    if @user.save
      render json: {state:"successful"}
    else
      render json: {state:"failed"}
    end
  end
  
  def show
  end

  def destroy
   @user = User.find(params[:id])
   @user.roles = @user.roles(&:to_s).delete "manufacturer"
    if @user.save
      render json: {state:"successful"}
    else
      render json: {state:"failed"}
    end
  end

  def authenrize
    authorize! :manage, :all
  end
end
