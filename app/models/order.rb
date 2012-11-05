class Order < ActiveRecord::Base
	attr_accessible :items_attributes, :confirmed, :buyer_id
	belongs_to :buyer
	has_many :order_items
	has_many :products, through :order_items
	
	after_update :remove_items_with_wrong_quantity
	
	def items_amount
	  self.order_items.count
	end
	
	def total_cost
		self.order_items.inject(0) do |sum, i|
			sum += i.cost
		end
	end
	
	def remove_items_with_wrong_quantity
		self.order_items.where("quantity <= 0").delete_all
	end
	
	def complete
		self.completed = true
		self.save
	end
	
end