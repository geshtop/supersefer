class BookController < ApplicationController
  def index

  
  		sub = params[:id].to_i
      @term = params[:q].to_s
      @subcategory = nil
  		@books = nil
  		if sub > 0
        @subcategory = Subcategory.where(id: sub, status_id:1).first
      
      		@books=Book.where(subcategory_id: sub, status_id: 1).order("priority Desc, title")
      	elsif @term != ''
          q = "%#{@term}%"
          @books = Book.joins("LEFT JOIN authors ON authors.id = books.author_id").where("books.title  like ? or authors.title  like ?" , q , q)
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

  def search
    @books = []
     term = params[:term]
      q = "%#{term}%"
    unless q == ''
      #@books = Book.all
      #@books = Book.where("title like ? " , q).limit(20).order("title")
      #@books = Book.joins(:author).where("`books`.`title`  like ? or `authors`.`title`  like ?" , q , q).limit(20)
      @books = Book.joins("LEFT JOIN authors ON authors.id = books.author_id").where("books.title  like ? or authors.title  like ?" , q , q).limit(20)

    end
    render :layout => false
  end

end
