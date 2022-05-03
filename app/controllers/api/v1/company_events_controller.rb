class Api::V1::CompanyEventsController < ApplicationController  
  before_action :set_company_event, only: [:show, :update, :destroy]

  # GET /company_events
  def index
    @company_events = CompanyEvent.page(params[:page] || 1).per(params[:per_page] || 5)

    render json: {status: 'SUCCESS', message: 'Loaded all company_events', code: 200, data: @company_events, meta: { total_pages: @company_events.total_pages, total_entries: @company_events.total_entries }}, status: :ok
  end

  # GET /company_events/1
  def show
    render json: {status: 'SUCCESS', message: 'Loaded company_event', code: 200, data: @company_event }, status: :ok
  end

  # POST /company_events
  def create
    @company_event = CompanyEvent.new(company_event_params)

    if @company_event.save
      render json: {status: 'SUCCESS', message: 'Successfully created company_event', code: 200, data: @company_event}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Unable to create company_event', code: 400, data: @company_event}, status: :error
    end
  end

  # PATCH/PUT /company_events/1
  def update
    if @company_event.update(company_event_params)
      render json: {status: 'SUCCESS', message: 'company_event successfully updated', code: 200, data: @company_event}, status: :ok
    else
      render json: { error: 'Unable to update company_event',status:error, code:400}, status: 400
    end
  end

  # DELETE /company_events/1
  def destroy
    @company_event.destroy
    render json: {status: 'SUCCESS', message: 'company_event successfully deleted', code: 200, data: @company_event}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_event
      @company_event = CompanyEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_event_params
      params.require(:company_event).permit(:category, :description, :title, :date, :cover_image_file_name, :location)
    end
end
