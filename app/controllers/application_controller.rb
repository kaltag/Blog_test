class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do
    redirect_to(access_denied_path)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end
end
