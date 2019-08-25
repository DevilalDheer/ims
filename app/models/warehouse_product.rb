class WarehouseProduct < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  validates_presence_of :product
  validates_presence_of :warehouse
  accepts_nested_attributes_for :product
end
