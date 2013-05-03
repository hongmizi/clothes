class ManufacturerController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_manufacturer

  def show
  end

  private
  def ensure_user_is_manufacturer
    if not current_user.has_role? :manufacturer
      redirect_to user_path(current_user.id), alert:"permission decline!", status:401 and return
    end
  end
end
