class AddTypeToFillUps < ActiveRecord::Migration[5.1]
  def change
    add_column :fill_ups, :type, :string
  end
end
