class AdminMailer < ActionMailer::Base
  default from: "from@example.com"
   def orders(email,order)
    @order = order
    mail(:to => email, :bcc => "geula.shoshan@gmail.com", :subject => "New order " + @order.id.to_s)
  end
end
