class Book < ActiveRecord::Base
	belongs_to :language
	belongs_to :subcategory
	belongs_to :author
	belongs_to :status	
	validates_presence_of :title, :status_id, :language_id, :subcategory_id, :price, :weight
	attr_accessible :title, :body,  :publisher, :status_id, :language_id, :weight,  :subcategory_id, :price, :image, :author_id, :priority, :description, :image_file_name, :best_seller #If exists
	##mount_uploader :image, ImageUploader
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']


    has_attached_file :image,
    :default_url =>   "noBook.jpg",
    :styles =>{
      :thumb => "80x120>", :medium => "160x240>", :large => "352X528>"
    },
    :storage => Rails.env.production? ? :s3 : :filesystem,
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET_NAME'],
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
	
                           
end
