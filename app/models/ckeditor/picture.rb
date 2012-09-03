class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
	                :styles =>{
					      :thumb => "80x120>", :medium => "160x240>", :large => "352X528>"
					    },
					    :storage => Rails.env.production? ? :s3 : :filesystem,
					    :s3_credentials => {
					      :bucket            => ENV['S3_BUCKET_NAME'],
					      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
					      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
					    }
	
	validates_attachment_size :data, :less_than => 3.megabytes
	validates_attachment_presence :data
	
	def url_content
	  url(:original)
	end
end

