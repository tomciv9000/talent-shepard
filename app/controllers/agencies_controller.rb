require 'pry'
class AgenciesController < ApplicationController
  def new
    @agency = Agency.new
  end

  def create
    binding.pry
    @agency = Agency.new(agency_params)
      if @agency.valid?
        @agency.save
        #session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/'
      end
  end

  def edit
  end

  private

  def agency_params
    params.require(:agency).permit(:name, :email, users_attributes: [:username, :first_name, :last_name, :email, :password, :confirmed, :agency_id, :admin])
  end
end

#  params[:agency][:users_attributes]["0"]