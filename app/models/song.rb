class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  scope :similar_songs, ->(song) { where("id != ? and title = ?", song.id, song.title) } 
  
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end 
  include Tire::Model::Search
  include Tire::Model::Callbacks  
end