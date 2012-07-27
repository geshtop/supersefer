Supersefer::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config



  devise_for :users

  #root :to => 'home#index'
  root :to => 'book#index'

  
  match ':controller(/:action(/:id))(.:format)'
end
