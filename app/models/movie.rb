class Movie < ActiveRecord::Base
  belongs_to :admin
  
  has_attached_file :movie_poster, :styles => {:medium => "300x600>", :thumb => '100x100>' }
  validates_attachment_content_type :movie_poster, :content_type => /\Aimage\/.*\Z/
end
