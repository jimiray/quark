Rails.application.routes.draw do
  #devise_for :users
  root to: 'pages#main'

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
    resources :articles do
      member do
        post :publish
        post :unpublish
      end
    end
    resources :pages
    resources :users
  end
end
