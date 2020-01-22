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


#params[:project]
#=> <ActionController::Parameters {"agency_id"=>"3", "name"=>"Mama's Family", "media_type"=>"TV series", "start_date(1i)"=>"2020", "start_date(2i)"=>"3", "start_date(3i)"=>"3", "union"=>"SAG-AFTRA", "notes"=>"testtttt", "casting_office_attributes"=>{"name"=>"Bowling-Mishia"}} permitted: false>
#[6] pry(#<ProjectsController>)> params[:project][:name]
#=> "Mama's Family"
#
#params[:project]["start_date(1i)"]
#=> "2020"