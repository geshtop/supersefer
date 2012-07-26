class Subcategory < ActiveRecord::Base
	belongs_to :language
	belongs_to :category
	has_many :books
	validates_presence_of :title, :status, :language_id, :category_id


end
