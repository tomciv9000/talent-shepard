require 'pry'
#add a find booking method before action
class BookingsController < ApplicationController
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
    if Booking.find_by(id: params[:id])
      @booking = Booking.find_by(id: params[:id])
    else
      redirect_to bookings_path
    end
  end

  def edit
    if Booking.find_by(id: params[:id])
      @booking = Booking.find_by(id: params[:id])
    else
      redirect_to bookings_path
    end
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
    if Booking.find_by(id: params[:id])
      @booking = Booking.find_by(id: params[:id])
    else
      redirect_to bookings_path
    end
  end



  private

  def booking_params
      params.require(:booking).permit(:role, :rate, :contract_signed, :accepted, :actor_id, :project_id, :agency_id)
  end


end