class HomeController < ApplicationController
	def index
		@portafolios = Portafolio.all
	end
end
