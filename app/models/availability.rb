class AvailabilityTimeRangeValidator < ActiveModel::Validator
    def validate(record)
        if record.start_time.to_f >= record.end_time.to_f
            record.errors.add :base, '시작 시간은 종료 시간보다 빨라야 합니다'
        end
    end
end

class Validator2 < ActiveModel::Validator
    def validate(record)
        @appointment = record.appointment
        @appointment_dates = @appointment.appointment_dates
        if not @appointment_dates.include? record.appointment_date
            record.errors.add :base,
                              '유효하지 않은 appointment date를 설정했습니다. appointment의 appointment_dates 범위 내에서 선택하셔야 합니다.'
        end
    end
end

class Availability < ApplicationRecord
    belongs_to :appointment,
               class_name: 'Appointment',
               foreign_key: :appointment_id
    belongs_to :user, class_name: 'User', foreign_key: :user_id
    belongs_to :appointment_date
    validates_presence_of :start_time,
                          :end_time,
                          :appointment,
                          :user,
                          :appointment_date
    validates_with AvailabilityTimeRangeValidator, Validator2

    def name
        return(
            "#{self.user.nickname}'s #{self.start_time.hour}-#{self.end_time.hour} #{self.appointment_date.date} for #{self.appointment.name}"
        )
    end
end
