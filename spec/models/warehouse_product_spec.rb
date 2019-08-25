require 'rails_helper'
RSpec.describe WarehouseProduct, type: :model do
  context 'association' do
    it "should belongs to product" do
      w = WarehouseProduct.reflect_on_association(:product)
      expect(w.macro).to eq(:belongs_to)
    end

    it "should belongs to warehouse" do
      w = WarehouseProduct.reflect_on_association(:warehouse)
      expect(w.macro).to eq(:belongs_to)
    end
  end
end