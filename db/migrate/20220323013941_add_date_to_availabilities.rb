class AddDateToAvailabilities < ActiveRecord::Migration[6.1]
  def change
    add_column :availabilities, :date, :date
  end
end
