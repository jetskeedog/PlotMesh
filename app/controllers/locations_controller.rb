class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  
  def index
    @locations = Location.popular
  end
  
  def show
    @similar_locations = Location.similar_locations(@location)
  end  
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @location = Location.find(params[:id])
    @location.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end
  
  def new
    @location = Location.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @location = @movie.locations.create(location_params)
    @location.user_id = current_user.id
    if @location.save
      flash[:success] = "#{@location.title} was added to #{@movie.title} as a location!"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
 private

  def set_location
    @location = Location.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
  def location_params
    params.require(:location).permit(:title, :description, :fictional)
  end

end


