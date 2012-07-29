class Subcategory < ActiveRecord::Base
	belongs_to :language
	belongs_to :category
	belongs_to :status
	has_many :books
	validates_presence_of :title, :status_id, :language_id, :category_id


end
