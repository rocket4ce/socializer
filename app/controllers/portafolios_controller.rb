class PortafoliosController < ApplicationController
  before_filter :authenticate_user! , except: [:index, :show]
  before_action :set_portafolio, only: [:show]
  impressionist :actions=>[:show,:index]
  # GET /portafolios
  # GET /portafolios.json
  def index
      @user = Portafolio.find_by(id: params[:id])
      @portafolios = Portafolio.all
  end

  # GET /portafolios/1
  # GET /portafolios/1.json
  def show
    @user = Portafolio.find_by(id: params[:id])
  end

  # GET /portafolios/new
  def new
    @portafolio = current_user.portafolios.new
  end

  # GET /portafolios/1/edit
  def edit
     @portafolio = current_user.portafolios.find_by(id: params[:id])
      unless @portafolio 
        redirect_to portafolios_path
      end
  end

  # POST /portafolios
  # POST /portafolios.json
  def create
    @portafolio = current_user.portafolios.new(portafolio_params)

    respond_to do |format|
      if @portafolio.save
        format.html { redirect_to @portafolio, notice: 'Portafolio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @portafolio }
      else
        format.html { render action: 'new' }
        format.json { render json: @portafolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portafolios/1
  # PATCH/PUT /portafolios/1.json
  def update
    @portafolio = current_user.portafolios.find(params[:id])
    respond_to do |format|
      if @portafolio.update(portafolio_params)
        format.html { redirect_to @portafolio, notice: 'Portafolio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @portafolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portafolios/1
  # DELETE /portafolios/1.json
  def destroy
    Portafolio.destroy
    respond_to do |format|
      format.html { redirect_to user_portafolios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portafolio
      @portafolio = Portafolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portafolio_params
      params.require(:portafolio).permit(:descripcion, :user_id, :titulo)
    end
end
