class Warehouse < ApplicationRecord
  has_many :warehouse_products
  has_many :products, through: :warehouse_products
  accepts_nested_attributes_for :warehouse_products
end
