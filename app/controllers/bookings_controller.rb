class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :confirm_delete]
  before_action :check_confirmation_status
  before_action :admin_only, only: [:confirm_delete, :destroy]

  def new
      @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
  
    if @booking.valid?
      @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to new_booking_path
    end
  end
  
  def show
  end

  def edit
  end

  def index
    @bookings = Booking.all
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def confirm_delete
  end



  private

  def booking_params
      params.require(:booking).permit(:role, :rate, :contract_signed, :accepted, :actor_id, :project_id, :agency_id)
  end

  def find_booking
    if Booking.find_by(id: params[:id])
      @booking = Booking.find_by(id: params[:id])
    else
      redirect_to bookings_path
    end
  end


end