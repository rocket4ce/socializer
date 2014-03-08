class HomeController < ApplicationController
	def index
		@portafolios = Portafolio.all
		@user = Portafolio.user_id
	end
end
