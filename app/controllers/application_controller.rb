class ApplicationController < ActionController::Base
  set_current_tenant_through_filter

  before_action :authenticate_user!
  before_action :find_current_tenant
  
  helper_method :current_user
  helper_method :current_agency


  private

  def find_current_tenant
    if current_user
      set_current_tenant(@current_user.agency)
    end
  end
  
  def check_confirmation_status
    if current_user && !current_user.confirmed
      flash[:alert] = "This account has not been confirmed by your agency's administrator."
      redirect_to '/'
    end
  end

  def admin_only
    if !current_user.admin
      flash[:alert] = "You do not have permission to access that page."
      redirect '/'
    end
  end
  
  def current_agency
    current_user.agency
  end



end
