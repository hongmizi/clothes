class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery

  def set_locale
    I18n.locale = 'cn'
    I18n.locale = params[:locale] if %w(cn en).include? params[:locale]
  end

end
