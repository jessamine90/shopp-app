class Order < ActiveRecord::Base
	attr_accessible :confirmed, :buyer_id
	has_many :order_items
	belongs_to :buyer
	
	def total_cost
		self.items.inject(0) do |sum, i|
			sum += i.cost
		end
	end
	
	def complete
		completed = true
		ordered_at = Time.now
		save
	end
end