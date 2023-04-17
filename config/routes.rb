Rails.application.routes.draw do

  root to: "home#index"

  resources :profiles do
    member do
      put "like" => "profiles#upvote"
      put "unlike" => "profiles#downvote"
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :messages
  resources :categories
  resources :vinyls do
    resources :offers
  end

  resources :user, :only => [:index, :edit] do
    resources :offers, :only => [:destroy]
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end


  get "offers_list", to: "home#offers_list"
  get "dashboard", to: "home#dashboard"
  
  get '/users/:user_id/offers', to: 'offers#user_offers', as: 'my_offers'

  post '/users/:user_id/offers/:id/accept', to: 'offers#accept', as: :swap_accepted
  
  post '/users/:user_id/offers/:id/decline', to: 'offers#decline', as: :swap_declined


  delete '/vinyls/:vinyl_id/offers/:id', to: 'offers#destroy', as: 'destroy'
  
  
  get "vinylslist", to: "shared#vinyls"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

