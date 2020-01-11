class ProjectsController < ApplicationController

  def new
      @project = Project.new(agency_id: @current_user.agency_id)
  end

  def create
    casting_office = CastingOffice.find_or_create_by(name: project_params[:casting_office_name])
    @project = casting_office.projects.build(project_params)
    if @project.valid?
      @project.save
      redirect_to project_path(@project)
    else
      redirect_to new_project_path
    end
  end
  
  def show
    if Project.find_by(id: params[:id])
      @project = Project.find_by(id: params[:id])
      render :show
    else
      redirect_to '/'
    end
  end


  private

  def project_params
      params.require(:project).permit(:name, :media_type, :start_date, :union, :notes, :agency_id, :casting_office_id, :casting_office_name)
  end

end
