class SearchController < ApplicationController
  
  def search
    if params[:q].nil?
      @genres = []
      @themes = []
      @movies = []
      @brands = []
      @commons = []
      @easter_eggs = []
      @goofs = []
      @locations = []
      @songs = []
      @technicals = []
    else
      @genres = Genre.search params[:q]
      @themes = Theme.search params[:q]
      @movies = Movie.search params[:q]
      @brands = Brand.search params[:q]
      @commons = Common.search params[:q]
      @easter_eggs = EasterEgg.search params[:q]
      @goofs = Goof.search params[:q]
      @locations = Location.search params[:q]
      @songs = Song.search params[:q]
      @technicals = Technical.search params[:q]
    end
  end

end 