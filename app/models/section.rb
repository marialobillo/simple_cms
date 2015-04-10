class Section < ActiveRecord::Base

	belongs_to :page
	has_many :section_edits
	has_many :editors, :through => :section_edits, 
	:class_name => "AdminUser"

	CONTENT_TYPES = ['text', 'HTML']

	# validates_presence_of :name
	# validates_length_of :name, :maximun => 255
	# valiidates_inclusion_of :content_type, :in => CONTENT_TYPES,
	# 	:message => "must be one of: #{CONTENT_TYPES.join(', ')}"
	# validates_presence_of :content

	validates :name, :presence => true, 
					:length => { :maximum => 255 }
	validates :content_type, :in => CONTENT_TYPES, 
							:inclusion => true, 
							:message => "must be one of: #{CONTENT_TYPES.join(', ')}"
	validates :content, :presence => true


	scope :visible, lambda { where(:visible => true)}
	scope :invisible, lambda { where(:visible => false)}
	scope :sorted, lambda { order("sections.position ASC")}
	scope :newest_first, lambda {order("sections.created_at DESC")}


end
