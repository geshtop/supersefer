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
    has_attached_file :image,
    :styles =>{
      :thumb => "80x120>", :medium => "160x240>"
    }
    :storage => :s3,
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET_NAME'],
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
	
                           
end
