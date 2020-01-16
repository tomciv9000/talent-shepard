class CastingOfficesController < ApplicationController
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
    if CastingOffice.find_by(id: params[:id])
      @casting_office = CastingOffice.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def index
    @casting_offices = CastingOffice.all
  end



  private

  def casting_office_params
      params.require(:casting_office).permit(:name, :email, :office_number, :location, :notes, :agency_id)
  end
end
