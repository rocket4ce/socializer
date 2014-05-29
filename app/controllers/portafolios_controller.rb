class PortafoliosController < ApplicationController
  before_filter :authenticate_user! , except: [:index, :show]
  before_action :set_portafolio, only: [:show,:edit,:update]
  impressionist :actions=>[:show,:index]


  def show
    @user = current_user
    @portafolios = Portafolio.find(params[:id])
    @cometarios
    @imagenes = @portafolios.uploads.all
  end



  def new
    # render text: params and return
      @user = current_user
      @portafolio = current_user.portafolios.new
      @portafolios = Portafolio.find_by(id: params[:id])
      @imagenes = @portafolio.uploads.build
  end



  def edit
     @portafolio = current_user.portafolios.find_by(id: params[:id])    
  end



  def create
    # render text: params and return
    @portafolio = current_user.portafolios.new(portafolio_params)
    respond_to do |format|
      if @portafolio.save
        params[:uploads]['imagen'].each do |a|
          @imagenes = @portafolio.uploads.create!(:imagen => a, :portafolio_id => @portafolio.id)
        end
        format.html { redirect_to root_path, notice: 'Portafolio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @portafolio }
      else
        format.html { render action: 'new' }
        format.json { render json: @portafolio.errors, status: :unprocessable_entity }
      end
    end

  end



  def update
 
    respond_to do |format|
      if @portafolio.update(portafolio_params)
        format.html { redirect_to user_portafolio_path, notice: 'Portafolio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @portafolio.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @portafolio.uploads.find(params[:id]).destroy
    current_user.portafolios.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to user_portafolios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portafolio
      @user = current_user
      @portafolio = @user.portafolios.find(params[:id])
      @comentarios = @portafolio.comentarios.all
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portafolio_params
      params.require(:portafolio).permit(:descripcion, :user_id, :titulo, uploads_attributes: [:id, :portafolio_id, :user_id, :imagen])
    end
end
