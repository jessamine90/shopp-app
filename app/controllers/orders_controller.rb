class OrdersController < ApplicationController
	
	def add_product
		matching_items = current_buyer.current_order.items.where("order_items.product_id = ?", params[:id])
		if matching_items.empty?
			product = Product.find(params[:id])
			current_buyer.current_order.items.create(product_id: @product.id, price: @product.price, quantity: params[:quantity])
			flash[:notice] = "Produkt dodany do koszyka."
		else
			order_item = matching_items.first
			if order_item.increase_quantity_by(params[:quantity])
				flash[:notice] = "Produkt juz w koszyku, zwiekszona ilosc."
			end
		end
		redirect_to :back
	end
	
	def update
		order = current_buyer.current_order
		order.update_attributes(params[:order])
		redirect_to :back, notice: "Koszyk zmieniony."
	end
	
	def show
	end
	
	def complete
		@order = current_buyer.current_order
		if @order.amount_of_items.zero?
			redirect_to cart_path, alert: "Your cart is empty."
		end
		if @order.update_attributes(params[:order])
			@order.complete!
		else
			render :payment
		end
	end
	
end