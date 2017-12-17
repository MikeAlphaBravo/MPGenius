class AddVehicleIdToFillUps < ActiveRecord::Migration[5.1]
  def change
    add_column :fill_ups, :vehicle_id, :integer
  end
end
