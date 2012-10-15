class ProductController < ActionController::Base
	def show
		@product = Product.find(params[:id])
	end
end