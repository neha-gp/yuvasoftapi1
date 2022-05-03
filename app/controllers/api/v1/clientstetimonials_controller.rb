class Api::V1::ClientstetimonialsController < ApplicationController  
  before_action :set_clientstetimonial, only: [:show, :update, :destroy]

  # GET /clientstetimonials
  def index
    @clientstetimonials = Clientstetimonial.page(params[:page] || 1).per(params[:per_page] || 5)

    render json: {status: 'SUCCESS', message: 'Loaded all clientstetimonials', code: 200, data: @clientstetimonials, meta: { total_pages: @clientstetimonials.total_pages, total_entries: @clientstetimonials.total_entries }}, status: :ok
  end

  # GET /clientstetimonials/1
  def show
    render json: {status: 'SUCCESS', message: 'Loaded clientstetimonial', code: 200, data: @clientstetimonial }, status: :ok
  end

  # POST /clientstetimonials
  def create
    @clientstetimonial = Clientstetimonial.new(clientstetimonial_params)

    if @clientstetimonial.save
      render json: {status: 'SUCCESS', message: 'Successfully created clientstetimonial', code: 200, data: @clientstetimonial}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Unable to create clientstetimonial', code: 400, data: @clientstetimonial}, status: :error
    end
  end

  # PATCH/PUT /clientstetimonials/1
  def update
    if @clientstetimonial.update(clientstetimonial_params)
      render json: {status: 'SUCCESS', message: 'clientstetimonial successfully updated', code: 200, data: @clientstetimonial}, status: :ok
    else
      render json: { error: 'Unable to update clientstetimonial',status:error, code:400}, status: 400
    end
  end

  # DELETE /clientstetimonials/1
  def destroy
    @clientstetimonial.destroy
    render json: {status: 'SUCCESS', message: 'clientstetimonial successfully deleted', code: 200, data: @clientstetimonial}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clientstetimonial
      @clientstetimonial = Clientstetimonial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clientstetimonial_params
      params.require(:clientstetimonial).permit(:name, :description, :city, :cover_image_file_name)
    end
end
