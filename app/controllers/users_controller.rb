# coding: UTF-8
class UsersController < ApplicationController
  before_filter :authenticate_user!
  def designer
    if not current_user.has_role? :designer
      redirect_to user_path(current_user.id), alert:"你没有权限访问此页面" and return
    end
  end

  def manufacturer
    if not current_user.has_role? :manufacturer
      redirect_to user_path(current_user.id), alert:"你没有权限访问此页面" and return
    end
  end
end
