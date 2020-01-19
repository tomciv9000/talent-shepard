class AgenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @agency = Agency.new
  end

  def create
    @agency = Agency.new(agency_params)
      if @agency.valid?
        @agency.save
        redirect_to new_agency_user_path(@agency)
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