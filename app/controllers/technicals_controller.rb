class TechnicalsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_technical, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  
  def index
    @technicals = Technical.popular
  end
  
  def show
    @similar_technicals  = Technical.similar_technicals(@technical)
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @technical = Technical.find(params[:id])
    @technical.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end
  
  def new
    @technical = Technical.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @technical = @movie.technicals.create(technical_params)
    @technical.user_id = current_user.id
    if @technical.save
      flash[:success] = "#{@technical.title} was added to #{@movie.title}!"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
 private

  def set_technical
    @technical = Technical.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
  def technical_params
    params.require(:technical).permit(:title, :description)
  end

end


