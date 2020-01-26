# frozen_string_literal: true
require 'pry'
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
  # GET /resource/sign_up
  def new
    #binding.pry
    #if params[:fb_agency]
    #  @user = User.new(agency_id: params[:fb_agency])
    #  session[:fb_agency_id] = @user.agency_id
    if session[:agency_id]
      @user = User.new(agency_id: session[:agency_id])
      #the below method should clear the session value out for the next time
      #session.delete[:agency_id]
    else
      @user = User.new
    end
  end

  # POST /resource
   def create
    super
  #  binding.pry
  #  @user = User.new(params[:user])
  #  @user.assign_defaults
  #
  #  if @user.valid?
  #    @user.save
  #    session[:user_id] = @user.id
  #    redirect_to user_path(@user)
  #  else
  #    redirect_to '/'
  #  endexit
   end

  # GET /resource/edit
  def edit
     super
  end

  # PUT /resource
  def update
     super
  end

  # DELETE /resource
  def destroy
     super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:agency_id, :first_name, :last_name])
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:agency_id, :first_name, :last_name])
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
