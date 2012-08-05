class ApplicationController < ActionController::Base
  protect_from_forgery

before_filter :get_session
def get_session
  @my_session_id = sessionid
end



 def sessionid
  	result = request.session_options[:id]
  	 if request.cookies[:session_id].nil?
		  request.cookies[:session_id] = { :value => result, :expires =>  1.week.from_now}
	   else
		  result = request.cookies[:session_id]
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
