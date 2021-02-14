class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # userカラム追記
    added_attrs = [ :name, :company, :tel, :postcode ]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  # ログイン後のリダイレクト先
  # def after_sign_in_path_for(resource)
  #   user_path(resource.id)
  # end

end
