class AppointmentDate < ApplicationRecord
    belongs_to :appointment
    validates_presence_of :date, :appointment

    def name
        return(
            "#{self.date} #{self.date.strftime('%A')} for #{self.appointment.name}"
        )
    end
end
