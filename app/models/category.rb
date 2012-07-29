class Category < ActiveRecord::Base
	belongs_to :language
	belongs_to :status
	has_many :subcategories
	validates_presence_of :title, :status_id, :language_id


end
