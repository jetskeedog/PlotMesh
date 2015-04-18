class Goof < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  scope :similar_goofs, ->(goof) { where("id != ? and title = ?", goof.id, goof.title) } 
  
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end 
  
end
