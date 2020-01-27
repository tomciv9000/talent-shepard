require 'pry'
#add a find project method before action
class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :confirm_delete]
  before_action :check_confirmation_status
  before_action :admin_only, only: [:confirm_delete, :destroy]

  def new
      @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.valid?
      @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end
  
  def show
  
  end

  def edit
 
  end

  def index
    @projects = Project.by_start_date
  end

  def stage
    @projects = Project.stage
  end

  def film
    @projects = Project.film
  end

  def commercial
    @projects = Project.commercial
  end

  def industrial
    @projects = Project.industrial
  end

  def short
    @projects = Project.short
  end

  def new_media
    @projects = Project.new_media
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def confirm_delete
 
  end



  private

  def project_params
      params.require(:project).permit(:name, :media_type, :start_date, :union, :notes, :agency_id, :casting_office_id, casting_office_attributes:[:name, :agency_id])
  end

  def find_project
    if Project.find_by(id: params[:id])
      @project = Project.find_by(id: params[:id])
    else
      redirect_to projects_path
    end
  end


end

