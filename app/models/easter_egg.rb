class EasterEgg < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  scope :similar_easter_eggs, ->(easter_egg) { where("id != ? and title = ?", easter_egg.id, easter_egg.title) } 
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end 
  
end
