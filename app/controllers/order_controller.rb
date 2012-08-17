class OrderController < ApplicationController
  before_filter :authenticate_user!
  def create
    @basketlist = Basket.where(session_id: @my_session_id)
    if (@basketlist.count == 0)
        flash[:notice] = "Your basket is empty"
        redirect_to root_url
      return
    end
  	@order = Order.new(params[:order])
  	@order.user_id = current_user.id
  	@order.user_email = current_user.email
  	@order.user_first_name = current_user.first_name
  	@order.user_last_name = current_user.last_name
  	@order.user_phone = current_user.phone
  	@order.user_idnum = current_user.idnum
  	@order.user_address = current_user.address
  	@order.user_city = current_user.city
  	@order.user_country = current_user.country
  	@order.user_zipcode = current_user.zipcode
  	@order.user_id = current_user.id
	
	@total = 0
	@total_weight = 0
	@count = 0
 	@basketlist.each do |basket|
 		@total += basket.book.price * basket.quantity
 		@total_weight += basket.book.weight * basket.quantity
 		@count += basket.quantity
 	end
 	@order.products_price = @total
 	@order.products_count = @count
 	@order.total_weight = @total_weight



 	#####shipping####
 	@shipping_id = @order.shipping_id
 	@shipping = Shipping.find(@shipping_id)
 	@shippingoption = @shipping.shippingoptions.first(:conditions => ["from_weight <= ? AND to_weight >= ?", @total_weight, @total_weight ])
 	@order.shipping_title = @shipping.title
  unless @shippingoption.nil?
 	@order.shippingoption_id = @shippingoption.id
  @order.shippingoption_title = @shippingoption.title
  @order.shipping_price = @shippingoption.price
  @order.grandtotal = @shippingoption.price + @total

 end

  @order.status_id = 1
  @order.language_id = 1
  @order.complete = false




    respond_to do |format|
      if @order.save
         #### save order items
        @basketlist.each do |basket|
         @oi= @order.orderitems.new
         @oi.book_id = basket.book_id
         @oi.quantity = basket.quantity
         @oi.title = basket.book.title
         @oi.body = basket.book.body
         @oi.description = basket.book.description
         @oi.weight = basket.book.weight
         @oi.author_id = basket.book.author_id
         unless basket.book.author.nil?
         @oi.author = basket.book.author.title
        end
        @oi.publisher = basket.book.publisher
        #@oi.image = basket.book.image
        @oi.price = basket.book.price
        @oi.status_id = 1
        @oi.language_id = 1
         @oi.save
        end 
        #clear the basket
        Basket.delete_all(session_id: @my_session_id)
        #send mail to admins
        AdminMailer.orders(current_user.email, @order).deliver
         
        format.html { redirect_to("/order/complete/" + @order.id.to_s) }
        else
		
        format.html { redirect_to(root_path) }
      end
    end



  end

  def complete
    @order = Order.where(id: params[:id], user_id: current_user.id).first
  
  end
end
