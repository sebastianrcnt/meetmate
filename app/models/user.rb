class User < ApplicationRecord
    has_many :appointments,
             class_name: 'Appointment',
             inverse_of: :owner,
             foreign_key: 'owner_id'
    has_many :availabilities,
             class_name: 'Availability',
             inverse_of: :user,
             foreign_key: 'user_id'

    def get_my_appointments
        return Appointment.where(owner_id: self.id)
    end

    def get_participating_appointments
        return(
            Appointment.all do |appointment|
                appointment.get_participants_set.include? self
            end
        )
    end
end
