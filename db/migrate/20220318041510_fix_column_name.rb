class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :appointments, :start_hout, :start_hour
  end
end
