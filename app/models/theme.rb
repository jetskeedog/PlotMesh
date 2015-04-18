class Theme < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  scope :similar_themes, ->(theme) { where("id != ? and title = ?", theme.id, theme.title) } 
  
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end 
  
end
