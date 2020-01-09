class SessionsController < ApplicationController
  
  def new
  end

  def create
    binding.pry
    @user = User.find_by(username: params[:username])
      if @user &&  @user.authenticate(params[:user][:password])
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
