class RemoveColumnTypeFromFillUps < ActiveRecord::Migration[5.1]
  def change
    remove_column :fill_ups, :type
  end
end
