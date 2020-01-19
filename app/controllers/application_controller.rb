class ApplicationController < ActionController::Base
    set_current_tenant_through_filter
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :authenticate_user!
    before_action :find_current_tenant
    
    helper_method :current_user
    helper_method :current_agency


    

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:agency_id, :first_name, :last_name])
  end


  private

  def find_current_tenant
    if current_user
      set_current_tenant(@current_user.agency)
    end
  end

#### verified user is replaced by authenticate_user! from devise
  #  def verified_user
  #    redirect_to '/' unless user_is_authenticated
  #  end
#
  #  def user_is_authenticated
  #    !!current_user
  #  end
#
  #  def current_user
  #      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #  end
#
    def current_agency
      current_user.agency
    end



end
