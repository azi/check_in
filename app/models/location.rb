class Location < ActiveRecord::Base
	
	belongs_to :user
	mount_uploader :pic, AvatarUploader
	validates :user_id, :name, :pic, :lng, :lat, :message, presence: true
  
end
