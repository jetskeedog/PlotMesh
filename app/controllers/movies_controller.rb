class MoviesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end
  
  def show
    @genres = Genre.where(movie_id: @movie.id)
    @brands = Brand.where(movie_id: @movie.id)
    @commons = Common.where(movie_id: @movie.id)
    @easter_eggs = EasterEgg.where(movie_id: @movie.id)
    @goofs = Goof.where(movie_id: @movie.id)
    @locations = Location.where(movie_id: @movie.id)
    @songs = Song.where(movie_id: @movie.id)
    @technicals = Technical.where(movie_id: @movie.id)
    @themes = Theme.where(movie_id: @movie.id)
    
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
      params.require(:movie).permit(:title, :year, :rated, :duration, :synopsis, :movie_poster)
    end
  
    def set_movie
      @movie = Movie.find(params[:id])
    end

end
