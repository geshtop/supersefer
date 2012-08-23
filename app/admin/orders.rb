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


end

  sidebar :user_information, :only => :show do
    attributes_table_for order do
      row("User") { auto_link order.user }
      row("Email") {order.user_email}
      row(" Name") {order.user_first_name + " " +order.user_last_name }
      row ("Phone"){order.user_phone }
      row ("Address") {order.user_address }
      row ("City") {order.user_city} 
      row ("Country"){order.user_country }
      row ("Zipcode"){order.user_zipcode}
      row ("Idnum") {order.user_idnum}

    end
  end



  show :title => :user_first_name do
    panel "Order Details" do
      table  do |t|
        tr do
          td "id"
          td order.id
        end
        tr do
          td "status"
          td order.status.title
        end

        tr do
          td "product_price"
          td order.products_price
        end
        tr do
          td "products_count"
          td order.products_count
        end
        tr do
          td "total_weight"
          td order.total_weight
        end
        tr do
          td "shipping_title"
          td order.shipping_title
        end  
        tr do
          td "shippingoption_title"
          td order.shippingoption_title
        end  
        tr do
          td "shipping_price"
          td order.shipping_price
        end
        tr do
        td "grandtotal"
        td order.grandtotal
        end

        tr do
          td "shipping"
          td do
              if order.has_shipping_address?

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
        tr do
          td "complete"
          td order.complete
        end  
        tr do
          td "notes"
          td order.notes
        end  
      end
      
    end


    panel "Books" do
      table_for(order.orderitems) do |t|
        t.column("Image") {|item| image_tag item.image, :style => "width:30px" }        
        t.column("Book") {|item| auto_link item.title }
        t.column("Price") {|item|  item.price }
        t.column("quantity") {|item|  item.quantity } 
          t.column("Total") {|item|  item.quantity * item.price }              
        tr :class => "odd" do
          td "Total:", :style => "text-align: left;"
          td " "
          td order.products_price
        end
        tr :class =>"odd" do
          td "Shipping:"
          td order.shipping_title
          td order.shipping_price
        end
         tr :class =>"odd" do
          td "Grand Total:"
          td " "
          td order.grandtotal
        end       


      
      end
    end

    active_admin_comments
  end

  #sidebar "Active Admin Demo" do
  # render('/admin/sidebar_links', :model => 'orders')
  #end

end
