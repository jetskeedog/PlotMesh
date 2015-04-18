class GoofsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_goof, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  
  def index
    @goofs = Goof.popular
  end
  
  def show
    @similar_goofs  = Goof.similar_goofs(@goof)
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @goof = Goof.find(params[:id])
    @goof.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end
  
  def new
    @goof = Goof.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @goof = @movie.goofs.create(goof_params)
    @goof.user_id = current_user.id
    if @goof.save
      flash[:success] = "The #{@goof.title} goof was added to #{@movie.title}!"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
 private

  def set_goof
    @goof = Goof.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
  def goof_params
    params.require(:goof).permit(:title, :description)
  end

end

