class AddTypeToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :type, :string
  end
end
