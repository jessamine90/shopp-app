class SpasController < ApplicationController
  def index
	@products = Product.all()
 	@categories = Category.all()
  end
  
  def show
  end
 	
  def get_categories
 	respond_to do |t|
 	  t.json { render :json => Category.all }
    end
  end
 	
  def get_products
 	respond_to do |t|
 	  t.json { render :json => Product.all }
 	end
  end
end