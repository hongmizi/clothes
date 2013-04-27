class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery

  def set_locale
    I18n.locale = 'en'
    I18n.locale = params[:locale] if %w(cn en).include? params[:locale]
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render :file => Rails.root.join("public", "404.html"), :status => 404
  end
end
