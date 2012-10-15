class ShopController < ActionController::Base
	def index
		@product = Product.all
	end
end