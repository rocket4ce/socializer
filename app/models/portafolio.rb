class Portafolio < ActiveRecord::Base

	belongs_to :user
	has_many :comentarios
	has_many :uploads, :dependent => :destroy
	accepts_nested_attributes_for :uploads
	is_impressionable

end
