class AddProducts < ActiveRecord::Migration
  def up
	create_table :products do |t|
      t.string :name
	  t.integer :price
      t.text :description
    end
  end

  def down
	drop_table :products
  end
end
