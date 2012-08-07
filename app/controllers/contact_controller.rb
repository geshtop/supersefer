class ContactController < ApplicationController
  def index
  end

  def contact_us
  	@user_id = 0
  	@user_phone = ""
  	@user_name = ""
  	@user_email =""
  	unless current_user.nil?
		@user_id = current_user.id
		@user_phone = current_user.phone
		@user_name = current_user.first_name + " " + current_user.last_name
		@user_email = current_user.email
	end
	@userName = params[:userName]
	@mail = params[:mail]
	@subject = params[:subject]
	@body = params[:body]
	AdminMailer.contact('g@geshtop.com', @userName, @mail, @subject, @body, @user_id ,@user_phone, @user_name,@user_email).deliver
	
  end
end
