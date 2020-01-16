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
  end

  def edit
  end

  def index
    @appointments = Appointment.all
  end
 
  def show
    
  end


  private

  def appointment_params
      params.require(:appointment).permit(:role, :time, :address, :callback, :booking_status, :notes, actor_id, casting_office_id, project_id, :agency_id)
  end

end
