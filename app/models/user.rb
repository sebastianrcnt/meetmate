class User < ApplicationRecord
    has_many :appointments, class_name: "Appointment", inverse_of: :owner, foreign_key: "owner_id"
end
