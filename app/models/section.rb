class Section < ActiveRecord::Base

	has_many :section_edits
	has_many :editors, :through => :section_edits, 
	:class_name => "AdminUser"

end
