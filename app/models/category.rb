class Category < ActiveRecord::Base
	belongs_to :language
	has_many :subcategories
	validates_presence_of :title, :status, :language_id


end
