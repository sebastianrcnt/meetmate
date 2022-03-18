class CreateAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :availabilities do |t|
      t.time :start_time
      t.time :end_time
      t.integer :appointment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
