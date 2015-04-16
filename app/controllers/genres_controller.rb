class GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  before_action :set_movie
  
  def index
    @genres = Genre.all
  end
  
  def show
 
  end
  
  def new
    @genre = Genre.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @genre = @movie.genres.create(genre_params)
    @genre.user_id = current_user.id
    if @genre.save
      flash[:success] = "Genre was added!"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
 private

  def set_genre
    @genre = Genre.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
  def genre_params
    params.require(:genre).permit(:title, :description)
  end

end

