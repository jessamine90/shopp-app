class ShopController < ApplicationController
	def new
	end

	def index
		@products = Product.all
		@categories = Category.all
	end
end