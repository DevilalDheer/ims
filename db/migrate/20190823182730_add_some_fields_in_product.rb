class AddSomeFieldsInProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sku_code, :string
    add_column :products, :name, :string
    add_column :products, :price, :float
  end
end
