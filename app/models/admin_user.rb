class AdminUser < ActiveRecord::Base

	#self.table_name = "admin_users"

	attr_accessor :first_name

	def last_name
		@last_name
	end

	def last_name=(value)
		@last_name = value
	end

end
