class Genre < ActiveRecord::Base
  belongs_to :movie
  validates :title, presence: true
end
