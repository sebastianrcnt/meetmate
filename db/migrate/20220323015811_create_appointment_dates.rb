class CreateAppointmentDates < ActiveRecord::Migration[6.1]
  def change
    create_table :appointment_dates do |t|
      t.date :date
      t.belongs_to :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
