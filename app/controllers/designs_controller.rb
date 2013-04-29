# coding: UTF-8
class DesignsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_designer
  def index
  end

  def new
    @design = Design.new
  end
  
  def create
    @design = current_user.designs.new(params[:design])
    if @design.save
      redirect_to designer_path, notice:"增加设计成功!" and return
    else
      redirect_to designer_path, alert:"增加设计失败!" and return
    end
  end

  def show
  end
  protected
  def ensure_user_is_designer
    if not current_user.has_role? :designer
      redirect_to user_path(current_user.id), alert:"你没有权限访问此页面" and return
    end
  end
end
