class AvailabilitiesController < ApplicationController
    before_action :set_availability, only: %i[show edit update destroy]

    # GET /availabilities or /availabilities.json
    def index
        @availabilities = Availability.all
    end

    # GET /availabilities/1 or /availabilities/1.json
    def show; end

    # GET /availabilities/new
    def new
        @availability = Availability.new
    end

    # GET /availabilities/1/edit
    def edit; end

    # POST /availabilities or /availabilities.json
    def create
        @availability = Availability.new(availability_params)

        respond_to do |format|
            if @availability.save
                format.html do
                    redirect_to availability_url(@availability),
                                notice: 'Availability was successfully created.'
                end
                format.json do
                    render :show, status: :created, location: @availability
                end
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json do
                    render json: @availability.errors,
                           status: :unprocessable_entity
                end
            end
        end
    end

    # PATCH/PUT /availabilities/1 or /availabilities/1.json
    def update
        respond_to do |format|
            if @availability.update(availability_params)
                format.html do
                    redirect_to availability_url(@availability),
                                notice: 'Availability was successfully updated.'
                end
                format.json do
                    render :show, status: :ok, location: @availability
                end
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json do
                    render json: @availability.errors,
                           status: :unprocessable_entity
                end
            end
        end
    end

    # DELETE /availabilities/1 or /availabilities/1.json
    def destroy
        @availability.destroy

        respond_to do |format|
            format.html do
                redirect_to availabilities_url,
                            notice: 'Availability was successfully destroyed.'
            end
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_availability
        @availability = Availability.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def availability_params
        params
            .require(:availability)
            .permit(:start_time, :end_time, :appointment_id, :user_id)
    end
end
