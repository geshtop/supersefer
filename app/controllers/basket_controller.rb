class BasketController < ApplicationController
  def add
  	
  		@bookid = params[:id].to_i
  		add_book(@bookid)

 
  	render :nothing =>   true

  end

  def remove
	@basketid = params[:id].to_i
	Basket.where(id: @basketid, session_id: @my_session_id).first.delete
	render :nothing =>   true
  end

  def update_quantity
  	@basketid = params[:id].to_i
  	@quantity= params[:quantity].to_i
  	basket=Basket.where(id: @basketid, session_id: @my_session_id).first
  	if(@quantity<1)
  		basket.delete
  	else

		unless basket.nil?
			basket.quantity = @quantity
			basket.save
		end
		
	end
	render :nothing =>   true
  end

	def add_book(bookid)
		@existbook = get_by_book(bookid)
		unless @existbook.nil?
			add_one_item(@existbook)
		else
			@book = Book.where(id: bookid,status_id: 1).first
			#TODO why i can see that enter to the basket not existing books???
			unless @book.nil?
				Basket.create(session_id: @my_session_id, book_id: bookid, quantity: 1)
			end
		end
	end

	def get_by_book(bookid)
		
		 Basket.where(session_id: @my_session_id, book_id: bookid).first
		
	end

	def add_one_item ( item)
		item.quantity = item.quantity+1
		item.save()
	end



end
