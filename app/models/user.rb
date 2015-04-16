class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
   has_attached_file :profilepic, :styles => {:medium => "300x300>", :thumb => '100x100>' }
   validates_attachment_content_type :profilepic, :content_type => /\Aimage\/.*\Z/
end
