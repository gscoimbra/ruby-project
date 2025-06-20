class CreateChairOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :chair_orders do |t|
      t.date :start_date
      t.date :end_date
      t.integer :units

      t.timestamps
    end
  end
end
