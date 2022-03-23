class AppointmentsController < ApplicationController
    before_action :set_appointment, only: %i[show edit update destroy]

    # GET /appointments or /appointments.json
    def index
        @appointments = Appointment.all
    end

    # GET /appointments/1 or /appointments/1.json
    def show; end

    # GET /appointments/new
    def new
        @appointment = Appointment.new
    end

    # GET /appointments/1/edit
    def edit; end

    # POST /appointments or /appointments.json
    def create
        @appointment = Appointment.new(appointment_params)

        respond_to do |format|
            if @appointment.save
                format.html do
                    redirect_to appointment_url(@appointment),
                                notice: 'Appointment was successfully created.'
                end
                format.json do
                    render :show, status: :created, location: @appointment
                end
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json do
                    render json: @appointment.errors,
                           status: :unprocessable_entity
                end
            end
        end
    end

    # PATCH/PUT /appointments/1 or /appointments/1.json
    def update
        respond_to do |format|
            if @appointment.update(appointment_params)
                format.html do
                    redirect_to appointment_url(@appointment),
                                notice: 'Appointment was successfully updated.'
                end
                format.json do
                    render :show, status: :ok, location: @appointment
                end
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json do
                    render json: @appointment.errors,
                           status: :unprocessable_entity
                end
            end
        end
    end

    # DELETE /appointments/1 or /appointments/1.json
    def destroy
        @appointment.destroy

        respond_to do |format|
            format.html do
                redirect_to appointments_url,
                            notice: 'Appointment was successfully destroyed.'
            end
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
        @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
        params
            .require(:appointment)
            .permit(:name, :description, :start_hour, :end_hour, :owner_id)
    end
end
