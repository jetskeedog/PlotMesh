class SongsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  
  def index
    @songs = Song.popular
  end
  
  def show
    @similar_songs  = Song.similar_songs(@song)
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @song = Song.find(params[:id])
    @song.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @song = @movie.songs.create(song_params)
    @song.user_id = current_user.id
    if @song.save
      flash[:success] = "The #{@song.title} song was added to #{@movie.title}!"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
 private

  def set_song
    @song = Song.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
  def song_params
    params.require(:song).permit(:title, :description)
  end

end


