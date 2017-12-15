class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :nickname
      t.string :year
      t.string :make
      t.string :model
      t.integer :odometer
      t.text :notes

      t.timestamps
    end
  end
end
