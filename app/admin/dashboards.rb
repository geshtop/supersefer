ActiveAdmin::Dashboards.build do

  section "Recent Orders", :priority => 1 do
    table_for Order.order('id desc').limit(10) do
      #column("user_email") {|order| status_tag(order.status) }
      column("ID"){|order| link_to order.id, admin_order_path(order)}
      column("User"){|order| order.user.email }
       column("Name"){|order| order.user_first_name + " " + order.user_last_name}
       column("Phone"){|order| order.user_phone}
     
      column("Total") {|order|  order.grandtotal }
      column("status"){|order| order.status.title}
      column("complete")
    end
  end

  section "Recent User", :priority => 2 do
    table_for User.order('id desc').limit(10).each do |user|
       column("User"){|user| link_to(user.email, admin_user_path(user)) }
       column("Name"){|user| user.first_name + " " + user.last_name}
       column("Phone"){|user| user.phone}
       column("Address"){|user|
        div do
          user.address 
        end
        div do
          user.city
        end
         div do
          user.country
        end       
     }
     end

  end

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
