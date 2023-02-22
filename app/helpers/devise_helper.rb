module DeviseHelper
  def devise_registration_error_messages
    flash.now[:registration_errors] = resource.errors.full_messages if resource.errors.any?
  end
end
