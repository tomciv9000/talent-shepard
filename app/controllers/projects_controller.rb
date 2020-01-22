require 'pry'
#add a find project method before action
class ProjectsController < ApplicationController

  def new
      @project = Project.new
  end

  def create
    @project = Project.new(project_params)

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
    else
      redirect_to projects_path
    end
  end

  def edit
    if Project.find_by(id: params[:id])
      @project = Project.find_by(id: params[:id])
    else
      redirect_to projects_path
    end
  end

  def index
    @projects = Project.all
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def confirm_delete
    if Project.find_by(id: params[:id])
      @project = Project.find_by(id: params[:id])
    else
      redirect_to projects_path
    end
  end



  private

  def project_params
      params.require(:project).permit(:name, :media_type, :start_date, :union, :notes, :agency_id, :casting_office_id, casting_office_attributes:[:name, :agency_id])
  end


end

