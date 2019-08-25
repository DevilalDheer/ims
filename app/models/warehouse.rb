class Warehouse < ApplicationRecord
  has_many :warehouse_products
  has_many :products, through: :warehouse_products
  accepts_nested_attributes_for :products

  validates :wh_code, uniqueness: true, length: { in: 4..16 }

  after_create :set_threshold_and_count_for_products

  def set_threshold_and_count_for_products
    warehouse_products.update_all(item_count: 0, low_item_threshold: 10)
  end
end
