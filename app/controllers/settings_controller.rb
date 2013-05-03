class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def profile
    @user = current_user
  end

  def update
    current_user.name = params[:name] if params[:name]
    current_user.address = params[:address] if params[:address]
    current_user.phone = params[:phone] if params[:phone]

    if current_user.save
      redirect_to :back, notice:"Success!" and return
    else
      redirect_to :back, alert:"Faild!" and return
    end
  end
end
