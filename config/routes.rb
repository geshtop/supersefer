Supersefer::Application.routes.draw do
  get "order/index"

  #mount Rich::Engine => '/rich', :as => 'rich'

  get "about/index"

  get "contact/index"

  get "cart/index"

  ActiveAdmin.routes(self)

  #devise_for :admin_users, ActiveAdmin::Devise.config



  devise_for :users, :controllers => { :sessions => "sessions" }

  #root :to => 'home#index'
  root :to => 'book#index'

  
  match ':controller(/:action(/:id))(.:format)'
end
