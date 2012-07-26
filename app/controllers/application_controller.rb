class ApplicationController < ActionController::Base
  protect_from_forgery

before_filter :get_session
def get_session
  @my_session_id = sessionid
end



 def sessionid
  	result = request.session_options[:id]
  	if request.cookies[:session_id].nil?
		cookies[:session_id] = { :value => result, :expires =>  1.week.from_now}
	else
		result = cookies[:session_id]
  	end
	result
  end
end
