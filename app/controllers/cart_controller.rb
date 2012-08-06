class CartController < ApplicationController
before_filter :authenticate_user!
  def index
  	 @basketlist = Basket.where(session_id: @my_session_id)
    if (@basketlist.count == 0)
    	flash[:notice] = "Your basket is empty"
        redirect_to root_url
      return
    end
  end
end
