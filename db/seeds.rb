# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# rake db:seed

WAREHOUSES = {'Mumbai' => '400001', 'New Delhi' => '110001', 'Bangalore' => '560001'}.freeze      

# Create Warehouses
warehouses = WAREHOUSES.each do |key,value|
  Warehouse.create!(
    wh_code: rand.to_s[4..16],
    name: key,
    pincode: value,
    max_capacity: 100
  )
end

# Create Products 
60.times do |n|
  product = Product.create!(
    sku_code: "#{Array.new(8){rand(1..9)}.join}",
    name: (:A..:Z).to_a.shuffle[0,10].join,
    price: rand(1..99999)
  )

  #Maintain Warehouse Products For Mumbai
  product.warehouse_products.create(
    warehouse_id: Warehouse.find_by_name('Mumbai').id,
    item_count: rand(1..60),
    low_item_threshold: 1
  )

  #Maintain Warehouse Products For New Delhi
  product.warehouse_products.create(
    warehouse_id: Warehouse.find_by_name('New Delhi').id,
    item_count: rand(1..60),
    low_item_threshold: 20
  )

  #Maintain Warehouse Products For Bangalor
  product.warehouse_products.create(
    warehouse_id: Warehouse.find_by_name('Bangalore').id,
    item_count: rand(1..60),
    low_item_threshold: 30
  )
end 