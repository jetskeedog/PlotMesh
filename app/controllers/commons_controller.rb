class CommonsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_common, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  
  def index
    @commons = Common.popular
  end
  
  def show
    @similar_commons = Common.similar_commons(@common)
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @common = common.find(params[:id])
    @common.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end
  
  def new
    @common = Common.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @common = @movie.commons.create(common_params)
    @common.user_id = current_user.id
    if @common.save
      flash[:success] = "The #{@common.title} common was added to  #{@movie.title}!"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
 private

  def set_common
    @common = Common.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
  def common_params
    params.require(:common).permit(:title, :description)
  end

end

