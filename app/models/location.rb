class Location < ActiveRecord::Base
	
	belongs_to :user
	mount_uploader :pic, AvatarUploader
	validates :user_id, :name, :pic, :longitude, :latitude, :message, presence: true

	reverse_geocoded_by :latitude, :longitude, :address => :address
  after_validation :reverse_geocode  # auto-fetch address
end
