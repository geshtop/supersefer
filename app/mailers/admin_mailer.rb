class AdminMailer < ActionMailer::Base
  default from: "geula.shoshan@gmail.com"
   def orders(email,order)
    @order = order
    mail(:to => email, :bcc => "geula.shoshan@gmail.com", :subject => "New order " + @order.id.to_s)
   end
   def contact(email, userName, mail, subject, body, user_id,user_phone, user_name,user_email)
	@userName=userName
	@mail = mail
	@subject = subject
	@body = body
	@user_id = user_id
	@user_phone = user_phone
	@user_name = user_name
	@user_email = user_email
    mail(:to => email, :cc => "geula.shoshan@gmail.com" :bcc => "g@geshtop.com" , :from=> @mail, :subject => "New Contact " + @subject.to_s)

   end
end
