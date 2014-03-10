class HomeController < ApplicationController
	def index
		@portafolios = Portafolio.all
		# @user = Portafolio.user.find_by(id: params[:id])
	end
end
