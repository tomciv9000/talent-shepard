class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :destroy]
  

  
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
      if @user &&  @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/'
      end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
