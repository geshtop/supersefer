Supersefer::Application.routes.draw do
  get "about/index"

  get "contact/index"

  get "cart/index"

  ActiveAdmin.routes(self)

  #devise_for :admin_users, ActiveAdmin::Devise.config



  devise_for :users

  #root :to => 'home#index'
  root :to => 'book#index'

  
  match ':controller(/:action(/:id))(.:format)'
end
