ActiveAdmin.register Book do
  	form(:html => { :multipart => true }) do |f|
	 f.inputs "Details" do
	    f.input :author
	    f.input :title
	    f.input :body
	   	f.input :description
	   f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.to_s.url(:medium))

	    f.input :thumbnail, :as => :file   
	    f.input :status
	    f.input :price
	    f.input :priority
	    f.input :subcategory
	    f.input :language
  end
  f.buttons
 end

end
