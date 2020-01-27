class CastingOfficesController < ApplicationController
  before_action :find_casting_office, only: [:show, :edit, :confirm_delete]
  before_action :check_confirmation_status
  before_action :admin_only, only: [:confirm_delete, :destroy]
  
  def new
    @casting_office = CastingOffice.new
  end

  def create
    @casting_office = CastingOffice.new(casting_office_params)
    if @casting_office.valid?
      @casting_office.save
      redirect_to casting_office_path(@casting_office)
    else
      redirect_to new_casting_office_path
    end
  end

  def show
  end

  def index
    @casting_offices = CastingOffice.all
  end

  def edit
  end

  def update
    @casting_office = CastingOffice.find(params[:id])
    @casting_office.update(casting_office_params)
    redirect_to casting_office_path(@casting_office)
  end

  def destroy
    @casting_office = CastingOffice.find(params[:id])
    @casting_office.destroy
    redirect_to casting_offices_path
  end

  def confirm_delete
  end

  private

  def find_casting_office
    if CastingOffice.find_by(id: params[:id])
      @casting_office = CastingOffice.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def casting_office_params
      params.require(:casting_office).permit(:name, :email, :office_number, :location, :notes, :agency_id)
  end
end
