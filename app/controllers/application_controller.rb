class ApplicationController < ActionController::Base
    set_current_tenant_through_filter
    
    before_action :verified_user
    before_action :find_current_tenant
    
    helper_method :current_user
    helper_method :current_agency

    private

    def find_current_tenant
      if current_user
        set_current_tenant(@current_user.agency)
      end
    end


    def verified_user
      redirect_to '/' unless user_is_authenticated
    end

    def user_is_authenticated
      !!current_user
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_agency
      current_user.agency
    end



end
