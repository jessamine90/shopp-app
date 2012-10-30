class SearchController < ApplicationController
  def results
    @categories = Category.all
    @query = params[:q].clone 
    @q = Product.search(@query)
    @result = @q.result
  end
end