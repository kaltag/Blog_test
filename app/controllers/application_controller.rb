class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do
    redirect_to(access_denied_path)
  end
end
