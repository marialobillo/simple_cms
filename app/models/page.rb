class Page < ActiveRecord::Base

	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :admn_users, :class_name => "AdminUser"


	validates :name, :presence => true, :length => { :maximum => 255 }
	validates :permalink, :presence => true, 
							:length => { :within => 3..255 },
							:uniqueness => true


	scope :visible, lambda { where(:visible => true)}
	scope :invisible, lambda { where(:visible => false)}
	scope :sorted, lambda { order("pages.position ASC")}
	scope :newest_first, lambda {order("pages.created_at DESC")}

end
