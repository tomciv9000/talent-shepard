class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :confirm_delete]
  before_action :check_confirmation_status
  before_action :admin_only, only: [:confirm_delete, :destroy]
  
  def new
    if params[:actor_id]
      @appointment = Appointment.new(actor_id: params[:actor_id])
    elsif params[:project_id]
      @appointment = Appointment.new(project_id: params[:project_id])
    else
      @appointment = Appointment.new
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.valid?
      @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)
  end

  def index
    @appointments = Appointment.all
  end
 
  def show
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  def confirm_delete
  end


  private

  def appointment_params
      params.require(:appointment).permit(:role, :time, :address, :callback, :booking_status, :notes, :actor_id, :casting_office_id, :project_id, :agency_id)
  end

  def find_appointment
    if Appointment.find_by(id: params[:id])
      @appointment = Appointment.find_by(id: params[:id])
    else
      redirect_to appointments_path
    end
  end
  


end
