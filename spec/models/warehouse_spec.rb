require 'rails_helper'
RSpec.describe Warehouse, type: :model do
  let(:warehouse) { Warehouse.new(name: 'Mumbai', 
      wh_code: '123456',pincode: '400001', max_capacity: 100) }
  before { warehouse.save }

  context 'warehouse is valid?' do
    it { expect(warehouse).to be_valid }
  end

  context 'wh_code uniqueness' do
    let(:warehouse1) { Warehouse.new(name: 'Mumbai', 
      wh_code: '123456',pincode: '400001', max_capacity: 100) }
    it { expect(warehouse1).to_not be_valid }
  end

  context 'association' do
    it "should have many products" do
      w = Warehouse.reflect_on_association(:products)
      expect(w.macro).to eq(:has_many)
    end

    it "should have many warehouse products" do
      w = Warehouse.reflect_on_association(:warehouse_products)
      expect(w.macro).to eq(:has_many)
    end
  end
end