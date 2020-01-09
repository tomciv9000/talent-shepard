require 'pry'
class UsersController < ApplicationController

  def new
    if params[:agency_id] && !Agency.exists?(params[:agency_id])
      redirect_to agencies_path, alert: "Agency not found."
    else  
      @user = User.new(agency_id: params[:agency_id])
    end
  end

  def create
    @user = User.new(user_params)
    @user.assign_defaults
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end
  
  def show
    if User.find_by(id: params[:id]) #&& session[:user_id]
      @user = User.find_by(id: params[:id])
      render :show
    else
      redirect_to '/'
    end
  end


  private

  def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :confirmed, :agency_id, :password, :admin)
  end

end
