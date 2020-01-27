class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]

  def agency_for_facebook
  end

  def facebook_new
    if params[:fb_agency]
      @user = User.new(agency_id: params[:fb_agency])
      session[:fb_agency_id] = @user.agency_id
    else
      @user = User.new
    end
  end
  
  def new
    if session[:agency_id]
      @user = User.new(agency_id: session[:agency_id])
    else
      @user = User.new
    end
  end
  
  def create
    super
  end
  
  def edit
     super
  end

  def update
     super
  end

  def destroy
     super
  end

  protected

  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:agency_id, :first_name, :last_name])
  end
  
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:agency_id, :first_name, :last_name])
  end


end
