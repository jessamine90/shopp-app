class AddProducts < ActiveRecord::Migration
  def up
	create_table :products do |product|
  		product.string :name
		product.integer :price
  		product.text :description
  		product.integer :category_id
  		product.timestamps
    end
  end

  def down
	drop_table :products
  end
end
