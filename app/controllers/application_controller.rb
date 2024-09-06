class ApplicationController < ActionController::Base
  # uncomment to allow extra User model params during registration (beyond email/password)
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    resource.widgets.count.zero? ? new_widget_path : dashboard_path
  end

  def maybe_skip_onboarding
    redirect_to dashboard_path, notice: "You're already subscribed" if current_user.paying_customer?
  end

  # whitelist extra User model params by uncommenting below and adding User attrs as keys
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  # end
end
