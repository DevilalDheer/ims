class AddSomeFieldsInProductWarehouse < ActiveRecord::Migration[5.2]
  def change
    add_column :product_warehouses, :item_count, :integer
    add_column :product_warehouses, :low_item_threshold, :integer
  end
end
