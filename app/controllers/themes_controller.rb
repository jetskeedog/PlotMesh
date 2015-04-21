class ThemesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_theme, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  
  def index
    @themes = Theme.popular
  end
  
  def show
    @similar_themes  = Theme.similar_themes(@theme)
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @theme = Theme.find(params[:id])
    @theme.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end
  
  def new
    @theme = Theme.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @theme = @movie.themes.create(theme_params)
    @theme.user_id = current_user.id
    if @theme.save
      flash[:success] = "#{@theme.title} theme was added to #{@movie.title}!"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
 private

  def set_theme
    @theme = Theme.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
  def theme_params
    params.require(:theme).permit(:title, :description, :spoiler)
  end

end