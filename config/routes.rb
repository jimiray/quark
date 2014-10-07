Rails.application.routes.draw do

  # Sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  #devise_for :users
  root to: 'articles#index'

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
    resource :profile, only: [:edit, :update]
    resources :articles do
      member do
        post :publish
        post :unpublish
      end
    end
    resources :pages
    resources :users do
      member do
        post :uninvite
      end
    end
    namespace :settings do
      resources :categories
    end
  end

  resources :articles

  get "/:id", to: "pages#show", as: 'page'

end
