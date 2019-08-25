class Warehouse < ApplicationRecord
  has_many :warehouse_products
  has_many :products, through: :warehouse_products
  accepts_nested_attributes_for :warehouse_products

  validates :wh_code, uniqueness: true, length: { in: 4..16 }
end
