class BrandsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  
  def index
    @brands = Brand.popular
  end
  
  def show
    @similar_brands = Brand.similar_brands(@brand)
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @brand = Brand.find(params[:id])
    @brand.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end
  
  def new
    @brand = Brand.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @brand = @movie.brands.create(brand_params)
    @brand.user_id = current_user.id
    if @brand.save
      flash[:success] = "The #{@brand.title} brand was added to #{@movie.title}!"
      redirect_to @movie
    else
      render 'new'
    end
  end
  
 private

  def set_brand
    @brand = Brand.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  
  def brand_params
    params.require(:brand).permit(:title, :description, :fictional)
  end

end

