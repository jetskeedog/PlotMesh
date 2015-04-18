class Movie < ActiveRecord::Base
  belongs_to :admin
  has_many :genres
  has_many :brands
  has_many :commons
  has_many :easter_eggs
  has_many :goofs
  has_many :locations
  has_many :songs
  has_many :themes
  has_many :technicals
  
  has_attached_file :movie_poster, :styles => {:medium => "300x450>", :small => "200x350>", :thumb => '100x100>' }
  validates_attachment_content_type :movie_poster, :content_type => /\Aimage\/.*\Z/
end
