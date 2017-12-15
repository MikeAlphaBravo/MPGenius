class CreateFillUps < ActiveRecord::Migration[5.1]
  def change
    create_table :fill_ups do |t|
      t.integer :odometer_reading
      t.integer :price_per_gallon
      t.integer :gallons_in_fill
      t.integer :total_cost
      t.integer :percent_city_highway
      t.text :notes

      t.timestamps
    end
  end
end
