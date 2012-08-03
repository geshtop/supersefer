ActiveAdmin.register Book do
  	form(:html => { :multipart => true }) do |f|
	 f.inputs "Details" do
	    f.input :author
	    f.input :title
	    f.input :body, :as => :rich, :config => {:width => "76%", :height => "400px"}
	   	f.input :description
	   	f.input :publisher
	    f.input :image, :as => :rich_picker,  :config =>{:style => "width:400px !important"} 
	    f.input :status_id
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
 		
 		image_tag	book.image.to_s, :style =>"width:50px"
 		
 	end
 	default_actions
 end

end
