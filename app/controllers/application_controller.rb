class ApplicationController < ActionController::Base

  before_action :confifure_permitted_parameters, if: :devise_controller?

private
def confifure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :result, :admin]) 
end

end
