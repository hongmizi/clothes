# coding: UTF-8
class DesignersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenrize
  def index
    @users = User.all.select {|user| user.has_role? :designer } 
  end

  def create
    @user = User.find(params[:id])
    @user.roles << :designer
    if @user.save
      #render json: {state:"successful"}
      redirect_to :back, notice:"增加设计师成功" and return
    else
      #render json: {state:"failed"}
      redirect_to :back, notice:"增加设计师失败" and return
    end
  end
  def update
  end
  def destroy
   @user = User.find(params[:id])
   @user.roles = @user.roles(&:to_s).delete "designer"
    if @user.save
      #render json: {state:"successful"}
      redirect_to :back, notice:"删除设计师成功" and return
    else
      #render json: {state:"failed"}
      redirect_to :back, notice:"删除设计师失败" and return
    end
  end
  def authenrize
    authorize! :manage, :all
  end
end
