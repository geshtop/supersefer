ActiveAdmin.register New do
form() do |f|
	 f.inputs "Details" do
	    f.input :title
	    f.input :body , :input_html => {:class => "ckeditor"}
	   	f.input :status
	   	f.input :language
	   	f.input :new_date
	   	f.input :from_date
	   	f.input :to_date

  end
  f.buttons
 end
 
  
end
