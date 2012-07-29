class Book < ActiveRecord::Base
	belongs_to :language
	belongs_to :subcategory
	belongs_to :author
	belongs_to :status	
	validates_presence_of :title, :status_id, :language_id, :subcategory_id, :price
	attr_accessible :title, :body, :publishere, :status_id, :language_id, :subcategory_id, :price, :image, :author_id, :priority, :description #If exists
	mount_uploader :image, ImageUploader


end
