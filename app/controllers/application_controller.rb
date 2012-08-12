class ApplicationController < ActionController::Base
  protect_from_forgery

before_filter :get_session
def get_session
  @my_session_id = sessionid
end



 def sessionid

  	result = request.session[:basket_id]
  	 if request.session[:basket_id].nil?
		  request.session[:basket_id] = request.session_options[:id]
		  result = request.session[:basket_id]
  	 end
	result
  end
end


def authenticate_active_admin_user!
    authenticate_user! 
    unless current_user.is_admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path 
    end
  end
