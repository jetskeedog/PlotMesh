class Movie < ActiveRecord::Base
  belongs_to :admin
  has_many :genres
  
  has_attached_file :movie_poster, :styles => {:medium => "300x450>", :small => "200x350>", :thumb => '100x100>' }
  validates_attachment_content_type :movie_poster, :content_type => /\Aimage\/.*\Z/
end
