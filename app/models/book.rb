class Book < ActiveRecord::Base
	belongs_to :language
	belongs_to :subcategory
	belongs_to :author	
	validates_presence_of :title, :status, :language_id, :subcategory_id, :price


end
