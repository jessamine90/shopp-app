class CartTables < ActiveRecord::Migration
  def up
  
	create_table :orders do |t|
		t.integer :buyer_id
		t.boolean :completed, default: false
		t.timestamp :ordered
		t.timestamps
	end
	
	create_table :order_items do |t|
		t.integer :order_id
		t.integer :product_id
		t.integer :quantity, default: 1
		t.integer :price
		t.timestamps
	end
	
	create_table :buyers do |t|
		t.string :first_name
		t.string :last_name
		t.text :address
	end
	
	create_table :adresses do |t|
		t.integer :order_id
		t.string :first_name
  		t.string :last_name
		t.text :address
		
		t.timestamps
	end
  end

  
  def down
  
	drop_table :orders
	drop_table :order_items
	drop_table :buyer
	drop_table :adresses
  end
end
