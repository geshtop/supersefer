class Author < ActiveRecord::Base
	belongs_to :language
	has_many :books
	validates_presence_of :title, :status, :language_id

	
end
