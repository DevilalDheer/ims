class Product < ApplicationRecord
  has_many :warehouse_products
  has_many :warehouses, through: :warehouse_products
  accepts_nested_attributes_for :warehouse_products

  validates :sku_code, uniqueness: true, length: { is: 8 }
end
