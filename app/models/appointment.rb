require 'set'
# time range validations
# https://api.rubyonrails.org/classes/ActiveModel/Validator.html
class AppointmentHourRangeValidator < ActiveModel::Validator
    def validate(record)
        @start_hour = record.start_hour
        @end_hour = record.end_hour
        if (@start_hour < 0) or (@start_hour > 23)
            record.errors.add :start_hour, '시작 시간은 0-23시여야 합니다'
        end

        if (@end_hour < 1) or (@end_hour > 24)
            record.errors.add :end_hour, '종료 시간은 1-24시여야 합니다'
        end

        if (@end_hour - @start_hour) < 1
            record.errors.add :base,
                              '시작 시간과 종료 시간의 차이는 1시간 이상이어야 합니다'
        end
    end
end

class Appointment < ApplicationRecord
    include ActiveModel::Validations
    has_many :appointment_dates
    has_many :availabilities,
             class_name: 'Availability',
             inverse_of: :appointment
    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
    validates_presence_of :start_hour, message: '시작 시간은 필수입니다'
    validates_presence_of :end_hour, message: '종료 시간은 필수입니다.'
    validates_presence_of :name, :description
    validates_with AppointmentHourRangeValidator

    def get_participants
        participants_set = get_participants_set
        return participants_set.to_a
    end

    def get_participants_set
        set = Set.new

        self.availabilities.each do |availability|
            set.add availability.user if not set.include? availability.user
        end

        return set
    end
end
