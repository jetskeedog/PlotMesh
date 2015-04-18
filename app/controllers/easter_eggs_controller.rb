class EasterEggsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_easter_egg, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  
  def index
    @easter_eggs = EasterEgg.popular
  end
  
  def show
    @similar_easter_eggs = EasterEgg.similar_easter_eggs(@easter_egg)
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @easter_egg = EasterEgg.find(params[:id])
    @easter_egg.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end
  
  def new
    @easter_egg = EasterEgg.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @easter_egg = @movie.easter_eggs.create(easter_egg_params)
    @easter_egg.user_id = current_user.id
    if @easter_egg.save
      flash[:success] = "The #{@easter_egg.title} easter egg was added to #{@movie.title}!"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
 private

  def set_easter_egg
    @easter_egg = EasterEgg.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
  def easter_egg_params
    params.require(:easter_egg).permit(:title, :description)
  end

end

