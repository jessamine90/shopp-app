class OrderItem < ActiveRecord::Base
	atrr_accesible :product_id, :quantity, :price, :order_id
	belongs_to :order
	belongs_to :product
	
	def cost
		(quantity*price)
	end
	
end