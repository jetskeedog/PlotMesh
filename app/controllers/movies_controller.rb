class MoviesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end
  
  def show
 
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = current_admin.movies.build(movie_params)
    if @movie.save
      flash[:success] = "Movie was added!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
 private


    def movie_params
      params.require(:movie).permit(:title, :year, :rated, :duration, :synopsis)
    end
  
    def set_movie
      @movie = Movie.find(params[:id])
    end

end
