class Genre < ActiveRecord::Base
  belongs_to :movie
  validates :title, presence: true
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  scope :similar_genres, ->(genre) { where("id != ? and title = ?", genre.id, genre.title) } 
  
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end 
  
  include Tire::Model::Search
  include Tire::Model::Callbacks
end
