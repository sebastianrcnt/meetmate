class AddAppointmentDateToAvailabilities < ActiveRecord::Migration[6.1]
    def change
        # https://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_reference
        add_reference :availabilities, :appointment_date, foreign_key: true
    end
end
