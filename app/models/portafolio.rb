class Portafolio < ActiveRecord::Base

	belongs_to :user
	has_many :comentarios
	is_impressionable

end
