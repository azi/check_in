class User < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader
	
	validates :nickname, :avatar, :device_token, :device_os, :device_os_version, presence: true
  validates :device_token, uniqueness: true

  has_many :locations
end
