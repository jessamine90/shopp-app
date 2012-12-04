class Admin::ProductsController < Admin::AdminController
 	
	def index
		@products = Product.all
 	end
 	
	def show
		@product = Product.find(params[:id])
 	end
 	
	def new
		@product = Product.create({:name => "New product", :description => "", :price => 0})
		redirect_to edit_admin_product_path(@product)
 	end
	
	def edit
		@product = Product.find(params[:id])
		@categories = Category.all
 	end
 	
	def create
		@product = Product.new(params[:product])	
		if @product.save
			redirect_to :back
		else
			redirect_to :back
		end
 	end
 	
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			redirect_to :back
		else
			redirect_to :back
		end
	end

 	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to :back
	end
end