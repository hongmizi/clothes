class DesignerController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_designer

  def show
    @designs = current_user.designs
  end

  private
  def ensure_user_is_designer
    if not current_user.has_role? :designer
      return redirect_to user_path(current_user), alert:"permission decline!"
    end
  end
end
