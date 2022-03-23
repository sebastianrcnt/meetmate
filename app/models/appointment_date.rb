class CustomAppointmentValidator < ActiveModel::Validator
    def validate(appointment_date)
        @is_invalid = false
        other_appointment_dates = appointment_date.appointment.appointment_dates
        other_appointment_dates.each do |other_appointment_date|
            if other_appointment_date.date == appointment_date.date
                @is_invalid = true
            end
        end

        if @is_invalid
            appointment_date.errors.add :base, '이미 존재하는 날짜입니다'
        end
    end
end

class AppointmentDate < ApplicationRecord
    belongs_to :appointment
    validates_presence_of :date, :appointment
    validates_with CustomAppointmentValidator

    def name
        return(
            "#{self.date} #{self.date.strftime('%A')} for #{self.appointment.name}"
        )
    end
end
