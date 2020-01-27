class ActorsController < ApplicationController
  before_action :find_actor, only: [:show, :edit, :confirm_delete]
  before_action :check_confirmation_status
  before_action :admin_only, only: [:confirm_delete, :destroy]

  def new
    @actor = Actor.new 
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.valid?
      @actor.save
      redirect_to actor_path(@actor)
    else
      render :new
    end
  end

  def update
    @actor = Actor.find(params[:id])
    @actor.update(actor_params)
    redirect_to actor_path(@actor)
  end

  def show
  end

  def index
    @actors = Actor.by_last_name
  end

  def sag
    @actors = Actor.sag_aftra
  end

  def aea
    @actors = Actor.aea
  end

  def nonunion
    @actors = Actor.non_union
  end

  def edit
  end

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    redirect_to actors_path
  end

  def confirm_delete
  end

  private

  def actor_params
      params.require(:actor).permit(:agency_id, :first_name, :last_name, :dob, :email, :gender_portrayal, :sag_aftra, :aea, :location, :notes)
  end

  def find_actor
    if Actor.find_by(id: params[:id])
      @actor = Actor.find_by(id: params[:id])
    else
      redirect_to actors_path
    end
  end

end
