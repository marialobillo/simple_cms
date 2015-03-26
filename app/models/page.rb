class Page < ActiveRecord::Base

	belongs_to :subject
	has_and_belongs_to_many :admn_users, :class_name => "AdminUser"

end
