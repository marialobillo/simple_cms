class Subject < ActiveRecord::Base


	has_many :pages

	acts_as_list

	validates :name, :presence => true, :length => { :maximum => 50 }


	scope :visible, lambda { where(:visible => true )}
	scope :invisible, lambda { where(:visible => false )}
	scope :sorted, lambda { order("subjects.position ASC")}
	scope :newest_firts, lambda { order("subject.created_at DESC")}
	scope :search, lambda {|query|
		where(["name LIKE ?", "%#{query}%"])
	}
end
