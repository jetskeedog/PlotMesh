class Common < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  scope :similar_commons, ->(common) { where("id != ? and title = ?", common.id, common.title) } 
  
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end 
  
  include Tire::Model::Search
  include Tire::Model::Callbacks  
end
