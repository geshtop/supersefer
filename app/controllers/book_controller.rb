class BookController < ApplicationController
  def index

  
  		@sub = params[:id].to_i
      
  		@books = nil
  		if @sub > 0

  		@books=Book.where(subcategory_id: @sub, status: 1).order("priority Desc, title")
  	else
  		@books=Book.where(status: 1).order("priority DESC, title")
  	end
	  #render :layout => false
  end

  def cart
    render :partial => 'main/cart'
  end
end
