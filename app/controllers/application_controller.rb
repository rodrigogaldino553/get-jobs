class ApplicationController < ActionController::API
 # before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit::Authorization

  #protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    # now it cant edit his avatar
    if action_name == 'create'
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description, :contact])
    elsif action_name == 'edit'
      binding.pry
      # por enquanto os custom fields nao poderao ser atualizados
      # devise_parameter_sanitizer.permit(:account_update)# , keys: [:avatar, :name, :status])
    end
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Sorry, You Are Not Authorized To Do This"
    redirect_to(request.referrer || root_path)
  end
end
