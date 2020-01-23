class AppointmentsController < ApplicationController
  
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
    @appointment.assign_casting
    if @appointment.valid?
      @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def edit
    if Appointment.find_by(id: params[:id])
      @appointment = Appointment.find_by(id: params[:id])
    else
      redirect_to appointments_path
    end
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
    if Appointment.find_by(id: params[:id])
      @appointment = Appointment.find_by(id: params[:id])
    else
      redirect_to appointments_path
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  def confirm_delete
    if Appointment.find_by(id: params[:id])
      @appointment = Appointment.find_by(id: params[:id])
    else
      redirect_to appointments_path
    end
  end


  private

  def appointment_params
      params.require(:appointment).permit(:role, :time, :address, :callback, :booking_status, :notes, :actor_id, :casting_office_id, :project_id, :agency_id)
  end

  


end
