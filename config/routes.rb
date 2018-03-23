Rails.application.routes.draw do
  
  get 'backoffice', to: 'backoffice/dashboard#index'
  
  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: [:show, :destroy]
    resources :admins, except: [:show]
    get 'dashboard', to: 'dashboard#index'
    get 'admins/index'
  end

  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :new, :create]
    end

    resources :ad_details, only: [:show] 
    resources :categories, only: [:show]
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members, controllers: { sessions: 'members/sessions' }

  root 'site/home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
