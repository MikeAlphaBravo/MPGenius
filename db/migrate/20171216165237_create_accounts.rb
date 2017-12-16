class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :vehicle_id
      
      t.timestamps
    end
  end
end
