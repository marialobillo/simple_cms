class AdminUser < ActiveRecord::Base

	#self.table_name = "admin_users"

	has_and_belongs_to_many :pages
	has_many :section_edits
end
