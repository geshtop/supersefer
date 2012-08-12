class SessionsController < Devise::SessionsController

    def destroy
        basket_id = request.session[:basket_id]
        super  
        request.session[:basket_id] = basket_id
    end

end