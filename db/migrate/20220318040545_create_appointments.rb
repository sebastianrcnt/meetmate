class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :description
      t.integer :start_hout
      t.integer :end_hour

      t.timestamps
    end
  end
end
