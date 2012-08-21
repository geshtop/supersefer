ActiveAdmin.register Order do
 actions :all, :except => [:destroy, :edit]

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
 			end
 			
 		end
 	end
 	column :products do |order|
 		table do
 			tr do
 				td do 
					"title"
 				end
  				td do 
					"price"
 				end	
  				td do 
					"quantity"
 				end	 
   				td do 
					"grandtotal"
 				end	 											
 			end
 			order.orderitems.each do |orderitem|
 			
 				tr do
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
 		
 	end
 	column :status
 	default_actions
 end



form do |f|
  f.inputs "Details" do 
    f.input :id
  end

  f.has_many :orderitems do |app_f|
    app_f.inputs "Orderitems" do
      

      app_f.input :title # it should automatically generate a drop-down select to choose from your existing patients
      app_f.input :price
    end
  end
end

end
