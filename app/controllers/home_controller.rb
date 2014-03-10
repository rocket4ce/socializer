class HomeController < ApplicationController
	impressionist :actions=>[:index]
	def index
		@portafolios = Portafolio.all
		# @user = Portafolio.user.find_by(id: params[:id])
		# impressionist(@portafolios,message:"wtf is a widget?") #message is optional
	end
end
