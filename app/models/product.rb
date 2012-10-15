class Product < ActiveRecord::Base
	attr_accessible :name, :price, :description, :category_id
end