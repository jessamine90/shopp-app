class Admin::OrdersController < Admin::AdminController
 	
	def index
		@orders = Order.where(:completed => 'true')
	end
end