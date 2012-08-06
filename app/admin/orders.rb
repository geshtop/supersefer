ActiveAdmin.register Order do
 


 index do
 	column :user do |order|
 		order.user_id.to_s + "/n asdf"
 	end
 	default_actions
 end
end
