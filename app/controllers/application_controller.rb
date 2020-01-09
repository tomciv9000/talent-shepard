class ApplicationController < ActionController::Base
    before_action :verified_user
    helper_method :current_user


    private

    def verified_user
      redirect_to '/' unless user_is_authenticated
    end

    def user_is_authenticated
      !!current_user
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
