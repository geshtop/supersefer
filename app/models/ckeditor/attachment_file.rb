class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url => "/ckeditor_assets/attachments/:id/:filename",
                    :path => ":rails_root/public/ckeditor_assets/attachments/:id/:filename",
			      :storage => Rails.env.production? ? :s3 : :filesystem,
			    :s3_credentials => {
			      :bucket            => ENV['S3_BUCKET_NAME'],
			      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
			      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
			    }
  validates_attachment_size :data, :less_than => 100.megabytes
  validates_attachment_presence :data
	
	def url_thumb
	  @url_thumb ||= Ckeditor::Utils.filethumb(filename)
	end
end



