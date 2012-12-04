class Admin::AdminController < ActionController::Base
 	before_filter :authenticate_admin_user!
	
 	def index
 	end
end