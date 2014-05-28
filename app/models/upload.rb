class Upload < ActiveRecord::Base
mount_uploader :imagen, AvatarUploader
	belongs_to :portafolio
end
