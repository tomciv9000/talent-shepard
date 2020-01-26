
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :agency_for_facebook, :facebook_new]
  before_action :admin_only, only: [:permissions, :index, :confirm_delete, :destroy]
  
  


  #def facebook_new
  #  if params[:fb_agency]
  #    @user = User.new(agency_id: params[:fb_agency])
  #    session[:fb_agency_id] = @user.agency_id
  #  else
  #    @user = User.new
  #  end
  #end


  def confirm_delete
    if User.find_by(id: params[:id])
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

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

def permissions
  if User.find_by(id: params[:id])
    @user = User.find_by(id: params[:id])
  else
    redirect_to '/'
  end
end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end


  private

  #def admin_only
  #  if !current_user.admin
  #    flash[:alert] = "You do not have permission to access that page."
  #    redirect '/'
  #  end
  #end

 

#
  def user_params
      params.require(:user).permit(:confirmed, :admin)
  end
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