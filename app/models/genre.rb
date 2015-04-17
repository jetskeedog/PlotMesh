class Genre < ActiveRecord::Base
  belongs_to :movie
  validates :title, presence: true
  
  
  has_reputation :votes, source: :user, aggregated_by: :sum
end
