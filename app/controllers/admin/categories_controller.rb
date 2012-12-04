class Admin::CategoriesController < Admin::AdminController

 	def index
		@categories = Category.all
 	end
 	
	def edit
		@category = Category.find(params[:id])
 	end
 	
	def create
		@category = Category.new(params[:category])
		@category.save
		redirect_to :back
 	end
	
 	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			redirect_to :back
		else
			redirect_to :back
		end
 	end
 	
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to :back
 	end
end