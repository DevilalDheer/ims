require 'rails_helper'
RSpec.describe Product, type: :model do
  let(:product) { Product.new(name: 'Abc', 
      sku_code: '12345678', price: 100) }
  before { product.save }

  context 'product is valid?' do
    it { expect(product).to be_valid }
  end

  context 'sku_code should be unique' do
    let(:product1) { Product.new(name: 'Xyz', 
      sku_code: '12345678', price: 100) }
    it { expect(product1).to_not be_valid }
  end

  context 'sku_code length should be 8 character' do
    let(:product2) { Product.new(name: 'Pqr', 
      sku_code: '123456', price: 100) }
    it { expect(product2).to_not be_valid }
  end

  context 'association' do
    it "should have many warehouses" do
      p = Product.reflect_on_association(:warehouses)
      expect(p.macro).to eq(:has_many)
    end

    it "should have many warehouse products" do
      p = Product.reflect_on_association(:warehouse_products)
      expect(p.macro).to eq(:has_many)
    end
  end
end