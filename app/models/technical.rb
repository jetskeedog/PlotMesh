class Technical < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  scope :similar_technicals, ->(technical) { where("id != ? and title = ?", technical.id, technical.title) } 
  
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end 
  include Tire::Model::Search
  include Tire::Model::Callbacks  
end
