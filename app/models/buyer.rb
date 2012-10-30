class Buyer < ActiveRecord::Base
	atrr_accesible :first_name, :last_name, :address
	has_many :orders
	
	def current_order
		orders.where(completed: false) || self.orders.create
	end
end