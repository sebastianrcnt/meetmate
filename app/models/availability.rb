class AvailabilityTimeRangeValidator < ActiveModel::Validator
    def validate(record)
        if record.start_time.to_f >= record.end_time.to_f
            record.errors.add :base, "시작 시간은 종료 시간보다 빨라야 합니다"
        end
    end
end

class Availability < ApplicationRecord
    belongs_to :appointment, class_name: "Appointment", foreign_key: :appointment_id
    belongs_to :user, class_name: "User", foreign_key: :user_id
    validates_presence_of :start_time, :end_time, :appointment_id, :user_id
    validates_with AvailabilityTimeRangeValidator
end

