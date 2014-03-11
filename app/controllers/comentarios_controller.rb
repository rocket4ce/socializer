class ComentariosController < ApplicationController
	before_action :cargar_portafolio
	
	def create
		@comentarios = @portafolio.comentarios.new(comentarios_params)
		respond_to do |format|
			if @comentarios.save
				# render text: params and return
				format.html { render action: 'show', status: :created, location: @portafolio, notice: 'Portafolio was successfully created.' }
			else
				redirect_to user_portafolio_path(user_id), alert: 'No hemos podido añadir tu comentario'
			end
		end
	end


    respond_to do |format|
      if @portafolio.save
        format.html { redirect_to root_path, notice: 'Portafolio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @portafolio }
      else
        format.html { render action: 'new' }
        format.json { render json: @portafolio.errors, status: :unprocessable_entity }
      end
    end


	
	def destroy
		@comentarios = @portafolio.comentarios.find(params[:id])
		@comentarios.destroy

		redirect_to user_portafolio_path, notice: 'Comentario eliminado'
	end
	
	private
	
	def cargar_portafolio
		@portafolio = Portafolio.find(params[:portafolio_id])
		@user = current_user
	end
	
	def comentarios_params
		params.require(:comentario).permit(:portafolio_id, :body)
	end
end
