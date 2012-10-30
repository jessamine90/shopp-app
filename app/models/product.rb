class Product < ActiveRecord::Base
	attr_accessible :name, :price, :description, :category_id
	belongs_to :category
	has_many :order_items
end