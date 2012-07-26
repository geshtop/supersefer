class Language < ActiveRecord::Base
	has_many :categories
	validates_presence_of :title, :status


end
