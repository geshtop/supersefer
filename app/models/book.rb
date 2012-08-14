class Book < ActiveRecord::Base
	belongs_to :language
	belongs_to :subcategory
	belongs_to :author
	belongs_to :status	
	validates_presence_of :title, :status_id, :language_id, :subcategory_id, :price, :weight
	attr_accessible :title, :body, :publisher, :status_id, :language_id, :weight,  :subcategory_id, :price, :image, :author_id, :priority, :description, :image_file_name #If exists
	##mount_uploader :image, ImageUploader
	has_attached_file :image, :styles =>{
      :thumb => "80x120>", :medium => "160x240>"
    }
	
                           
end
