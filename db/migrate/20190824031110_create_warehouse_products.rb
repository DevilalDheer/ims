class CreateWarehouseProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouse_products do |t|
      t.integer :warehouse_id
      t.integer :product_id
      t.integer :item_count
      t.integer :low_item_threshold

      t.timestamps
    end
  end
end
