require 'pry'

class ActorsController < ApplicationController
  
  def new
    @actor = Actor.new 
  end

  def create
    binding.pry
    @actor = Actor.new(actor_params)

    if @actor.valid?
      @actor.save
      redirect_to actor_path(@actor)
    else
      redirect_to new_actor_path
    end
  end

  def show
    if Actor.find_by(id: params[:id])
      @actor = Actor.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def index
  end

  def edit
  end

  private

  def actor_params
      params.require(:actor).permit(:agency_id, :first_name, :last_name, :dob, :email, :gender_portrayal, :sag_aftra, :aea, :location, :notes)
  end


end
