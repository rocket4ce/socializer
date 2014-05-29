class Upload < ActiveRecord::Base
mount_uploader :imagen, AvatarUploader
	belongs_to :portafolio
	belongs_to :user
end
