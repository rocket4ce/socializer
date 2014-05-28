class UploadsController < ApplicationController
  before_action :carga_portafolio


	def create
	    @uploads = Upload.new(photo_params)
	    @uploads.save
		# render text: params and return
		# @uploads = @portafolio.uploads.new(uploads_params)
		# @uploads.user_id = current_user.id
		# respond_to do |format|
		# 	if @uploads.save
		# 		format.html { redirect_to user_portafolio_path(@portafolio.user_id, @portafolio), notice: 'Portafolio was successfully created.' }
		# 	else
		# 		redirect_to user_portafolio_path(@portafolio.user_id, @portafolio), alert: 'No hemos podido añadir tu comentario'
		# 	end
		# end
	end
	
	def destroy
		@uploads = @portafolio.uploads.find(params[:id])
		@uploads.destroy

		redirect_to user_portafolio_path(@portafolio.user_id, @portafolio), notice: 'Comentario eliminado'
	end

  private
	def cargar_portafolio
		@portafolio = Portafolio.find(params[:portafolio_id])
		@user = current_user
	end

	def uploads_params
		params.require(:upload).permit(:portafolio_id, :imagen)
	end
end
