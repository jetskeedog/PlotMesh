class GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  before_action :set_movie


  def index
    @genres = Genre.popular
  end

  def show
    @similar_genres = Genre.similar_genres(@genre)
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @genre = Genre.find(params[:id])
    @genre.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end
  
  def new
    @genre = Genre.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @genre = @movie.genres.create(genre_params)
    @genre.user_id = current_user.id
    if @genre.save
      flash[:success] = "The #{@genre.title} genre was added to #{@movie.title}!"
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