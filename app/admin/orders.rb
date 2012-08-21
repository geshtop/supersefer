ActiveAdmin.register Order do
 actions :all, :except => [:destroy, :new]

index do
	column :id
 	column :user do  |order|
 		div do
 			order.user_email
 		end
 		div do
 			order.user_first_name + " " + order.user_last_name
 		end
 	 	div do
 			order.user_phone
 		end	
 	 	 div do
 			order.user_address
 		end		
 		div do
 			order.user_city
 		end
 		div do
 			order.user_country
 		end
 		div  do
 			order.user_zipcode
 		end
 		div do 
 			hr  do end
 			if order.has_shipping_address?
	 			div do
					"shipping:" 

				end
				div do
		 			order.shipping_first_name + " " + order.shipping_last_name
		 		end

		 	 	 div do
		 			order.shipping_phone
		 		end	
		 	 	 div do
		 			order.shipping_address
		 		end		
		 		div do
		 			order.shipping_city
		 		end
		 		div do
		 			order.shipping_country
		 		end
		 		div do
		 			order.shipping_zipcode
		 		end
 			end
 			
 		end
 	end
 	column :products do |order|
 		table do
 			tr do
 				th do
 				end
 				th do 
					"title"
 				end
  				th do 
					"price"
 				end	
  				th do 
					"quantity"
 				end	 
   				th do 
					"total"
 				end	 											
 			end
 			order.orderitems.each do |orderitem|
 			
 				tr do
 					td do
 						image_tag orderitem.image , {width:30}
 					end
 					td do
						orderitem.title 
 					end
 					td do 
						orderitem.price 
 					end
 	 				td do 
						orderitem.quantity 
 					end	
  	 				td do 
						orderitem.quantity * orderitem.price
 					end									

 				end
 				
 				

 			end
 			tr do
 				td do
 					"shipping"
 				end
 				td do
 					order.shipping_title
 				end
 				td do
 					order.shipping_price
 				end	
  				td do
 					"-"
 				end	
 				td do
 					order.shipping_price
 				end								
 			end
  			tr do
 				td do
 					"total"
 				end
 				td do "-"
 						end
 				td do
 					"-"
 				end	
  				td do
 					"-"
 				end	
 				td do
 					order.grandtotal
 				end								
 			end			


 		end
 		div do
 			order.notes
 		end
 	end
 	column :status_id do |order|
 		div :class => "status" + order.status_id.to_s do
 		order.status.title
 		end

 	end 
 	default_actions
 end



form do |f|
  f.inputs "Details" do 
    f.input :id
    f.input :user_id, :input_html => { :disabled => true }
    f.input :user_email , :input_html => { :disabled => true }
    f.input :user_first_name	, :input_html => { :disabled => true }
    f.input :user_last_name		, :input_html => { :disabled => true }
    f.input :user_phone			, :input_html => { :disabled => true }
    f.input :user_idnum			, :input_html => { :disabled => true }
    f.input :user_address		, :input_html => { :disabled => true }
    f.input :user_city			, :input_html => { :disabled => true }
    f.input :user_country, :as => :string	, :input_html => { :disabled => true }
    f.input :user_zipcode		, :input_html => { :disabled => true }
    f.input :products_price		, :input_html => { :disabled => true }
    f.input :products_count		, :input_html => { :disabled => true }
    f.input :total_weight		, :input_html => { :disabled => true }
    f.input :shipping_id 		, :input_html => { :disabled => true }
    f.input :shipping_title , :input_html => { :disabled => true }
    f.input :shippingoption_id , :input_html => { :disabled => true }
    f.input :shippingoption_title	, :input_html => { :disabled => true }
    f.input :shipping_price		, :input_html => { :disabled => true }
    f.input :grandtotal			, :input_html => { :disabled => true }
    f.input :has_shipping_address , :input_html => { :disabled => true }
    f.input :shipping_first_name	, :input_html => { :disabled => true }
    f.input :shipping_last_name	, :input_html => { :disabled => true }
    f.input :shipping_phone	, :input_html => { :disabled => true }
    f.input :shipping_address , :input_html => { :disabled => true }
    f.input :shipping_city	, :input_html => { :disabled => true }
    f.input :shipping_country , :as => :string , :input_html => { :disabled => true }
    f.input :shipping_zipcode , :input_html => { :disabled => true }
    f.input :notes , :input_html => { :disabled => true }
    f.input :status
    f.input :complete
    f.buttons
  end

  #f.has_many :orderitems do |app_f|
  #  app_f.inputs "Orderitems" do
  #    app_f.input :title 
  #    app_f.input :price
  #  end
  #end

#      language_id: 1, complete: false,  notes: "הערות נוספות"> 


  #one to many in module work good / need add to the module accepts_nested_attributes_for :orderitems
  #f.has_many :orderitems do |app_f|
  #  app_f.inputs "Orderitems" do
  #    app_f.input :title 
  #    app_f.input :price
  #  end
  #end
end

end
