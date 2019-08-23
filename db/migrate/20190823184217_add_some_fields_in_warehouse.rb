class AddSomeFieldsInWarehouse < ActiveRecord::Migration[5.2]
  def change
    add_column :warehouses, :wh_code, :string
    add_column :warehouses, :name, :string
    add_column :warehouses, :pincode, :string
    add_column :warehouses, :max_capacity, :integer
  end
end
