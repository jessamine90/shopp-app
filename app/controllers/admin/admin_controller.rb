class Admin::AdminController < ApplicationController
	before_filter :authenticate_admin_admin_user!
	def index
		#@orders = Order.all
	end
end