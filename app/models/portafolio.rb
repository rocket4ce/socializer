class Portafolio < ActiveRecord::Base

	belongs_to :user
	is_impressionable
	acts_as_commentable
end
