# coding: UTF-8
class Admin::ManufacturersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenrize

  def index
    @users = User.all.select { |user| user.has_role? :manufacturer}
  end

  def new
  end

  def create
    @user = User.find(params[:id])
    @user.roles << :manufacturer
    if @user.save
      redirect_to :back, notice:"增加厂家成功" and return
    else
      redirect_to :back, notice:"增加厂家失败" and return
    end
  end
  
  def show
  end

  def destroy
   @user = User.find(params[:id])
   @user.roles = @user.roles(&:to_s).delete "manufacturer"
    if @user.save
      redirect_to :back, notice:"删除厂家成功" and return
    else
      redirect_to :back, notice:"删除厂家失败" and return
    end
  end

  def authenrize
    authorize! :manage, :all
  end
end
