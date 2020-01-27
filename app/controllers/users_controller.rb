class UsersController < ApplicationController
  before_action :find_user, only: [:show, :permissions, :confirm_delete]
  skip_before_action :authenticate_user!, only: [:new, :create, :agency_for_facebook, :facebook_new]
  before_action :admin_only, only: [:permissions, :index, :confirm_delete, :destroy]


  def confirm_delete
  end

  def show
  end

  def permissions
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

  def user_params
      params.require(:user).permit(:confirmed, :admin)
  end

  def find_user
    if User.find_by(id: params[:id])
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

end
