class OrderItem < ActiveRecord::Base
	attr_accesible :product_id, :quantity, :price, :order_id
	belongs_to :order
	belongs_to :product
	
	def cost
		(quantity*price)
	end
	
	def quantity
	  1
	end
	
	def increase_quantity_by(quantity_to_add)
		quantity_to_add = quantity_to_add.to_i
		if quantity_to_add > 0
			self.quantity += quantity_to_add
			self.save
			true
		else
			false
		end
	end
	
end