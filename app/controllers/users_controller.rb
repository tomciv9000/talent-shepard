#require 'pry'
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :agency_for_facebook]
#  before_action :find_user_or_redirect, :only => [:show, :edit, ]
#  #before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  def agency_for_facebook
    #@user = User.new
  end


#  #def new
#  #  if params[:agency_id] && !Agency.exists?(params[:agency_id])
#  #    redirect_to agencies_path, alert: "Agency not found."
#  #  else  
#  #    @user = User.new(agency_id: params[:agency_id])
#  #  end
#  #end
#
#  def create
#    @user = User.new(user_params)
#    @user.assign_defaults
#    if @user.valid?
#      @user.save
#      session[:user_id] = @user.id
#      redirect_to user_path(@user)
#    else
#      redirect_to '/'
#    end
#  end

    
#  
    def show
      if User.find_by(id: params[:id])
        @user = User.find_by(id: params[:id])
      else
        redirect_to '/'
      end
    end
#
#  #def edit
#  #  if User.find_by(id: params[:id])
#  #    @user = User.find_by(id: params[:id])
#  #  else
#  #    redirect_to '/'
#  #  end
#  #end
#
#  def update
#    @user = User.find(params[:id])
#    @user.update(user_params)
#    redirect_to user_path(@user)
#  end
#
#
#  private
#
#  def user_params
#      params.require(:user).permit(:username, :first_name, :last_name, :email, :confirmed, :agency_id, :password, :admin)
#  end
#
#  def find_user_or_redirect
#    if User.find_by(id: params[:id])
#      @user = User.find_by(id: params[:id])
#    else
#      redirect_to '/'
#    end
#  end
#
end
#