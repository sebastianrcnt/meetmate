class RemoveDateFromAvailabilities < ActiveRecord::Migration[6.1]
    def change
        remove_column :availabilities, :date, :date
    end
end
