class OrderItem < ActiveRecord::Base
	atrr_accesible :product, :quantity, :price
	belongs_to :order
	belongs_to :product
end