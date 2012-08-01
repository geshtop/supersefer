class BookController < ApplicationController
  def index

  
  		sub = params[:id].to_i

      @subcategory = nil
  		@books = nil
  		if sub > 0
        @subcategory = Subcategory.where(id: sub, status_id:1).first
      
      		@books=Book.where(subcategory_id: sub, status_id: 1).order("priority Desc, title")
      	else
      		@books=Book.where(status_id: 1).order("priority DESC, title")
      	end
    	  #render :layout => false
  end

  def details
    @id = params[:id].to_i
    @book = Book.where(id:@id, status_id:1).first
    #@book = Book.first

  end


  def cart
    render :partial => 'main/partial/cart'
  end

  def basketcart
    render :partial => 'main/partial/basketcart'
  end


end
