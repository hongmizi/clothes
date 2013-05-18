class ProfileController < ApplicationController
  def show
    @user = current_user
  end

  def update
    current_user.name = params[:name] if params[:name]
    current_user.address = params[:address] if params[:address]
    current_user.phone = params[:phone] if params[:phone]

    if current_user.save
      redirect_to :back, notice:"Update Successful!" and return
    else
      redirect_to :back, alert:"Update Failed!" and return
    end

  end
end
