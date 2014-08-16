Rails.application.routes.draw do
  #devise_for :users


  devise_for :users, :controllers => { :sessions => "admin/sessions" }
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  namespace :admin do
    resource :dashboard
    resources :articles
    resources :pages
    resources :users
  end
end
