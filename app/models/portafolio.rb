class Portafolio < ActiveRecord::Base

	belongs_to :user
	is_impressionable
end
