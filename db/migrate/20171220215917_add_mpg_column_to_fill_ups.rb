class AddMpgColumnToFillUps < ActiveRecord::Migration[5.1]
  def change
    add_column :fill_ups, :mpg, :decimal
  end
end
