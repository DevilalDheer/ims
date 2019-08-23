class CreateProductWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :product_warehouses do |t|

      t.timestamps
    end
  end
end
