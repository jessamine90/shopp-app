class OrderController < ApplicationController
 	def add 
		@product = Product.find(params[:id])
		@order_item = OrderItem.where(:product_id => @product.id, :order_id => @current_cart.id).first
		if @order_item == nil
			@order_item = OrderItem.create(:product_id => @product.id, :order_id => @current_cart.id,:quantity => 1)
		else
			@order_item.quantity += 1
			@order_item.save
		end 
		redirect_to :back
 	end
 	
	def delete
		@orderitem = OrderItem.find(params[:id])
		@orderitem.destroy
		redirect_to :back
 	end
	
	def checkout
		@order = Order.find(@current_cart.id)
		if @order.order_items.empty?
			flash[:notice] = 'Empty cart'
			redirect_to :back
		else
			@order.completed = true
			@order.save
			@current_cart = Order.create(:buyer_id => @current_buyer.id,:completed => 'false')
			redirect_to :back
		end
 	end
end