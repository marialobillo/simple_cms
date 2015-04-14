class AdminUsersController < ApplicationController
  
	layout 'admin'

	before_action :confirm_logged_in 

	def index
		@admin_users = AdminUser.sorted
	end

	def new
		@admin_user = AdminUser.new
	end

	def edit
		@admin_user = AdminUser.new(admin_user_params)
	end

	def delete
	
	end

end
