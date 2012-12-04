class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :initialize_current_buyer
  
	def initialize_current_buyer
		if cookies[:buyer_id].present?
			@current_buyer = Buyer.find(cookies[:buyer_id])
		else
			@current_buyer = Buyer.create
			cookies[:buyer_id] = { value: @current_buyer.id, expires: 1.week.from_now }
		end
		@current_cart = @current_buyer.orders.where(:completed => 'false').first
		if @current_cart == nil
			@current_cart = Order.create(:buyer_id => @current_buyer.id,:completed => 'false')
		end
 	end
end
