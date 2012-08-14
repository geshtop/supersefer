ActiveAdmin.register Book do
  	form(:html => { :multipart => true }) do |f|
	 f.inputs "Details" do
	    f.input :author
	    f.input :title
	    f.input :body
	   	f.input :description
	   	f.input :publisher
	    f.input :image, :as => :file
	    f.input :status
	    f.input :price
	    f.input :weight	    
	    f.input :priority
	    f.input :subcategory
	    f.input :language
  end
  f.buttons
 end
 index do
 	column :title
 	column :subcategory
 	column :price
 	column :image do |book|
 		
 		image_tag	book.image.url(:thumb), :style =>"width:80px"
 		
 	end
 	default_actions
 end

end
