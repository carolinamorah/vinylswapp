Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :messages
  resources :categories
  resources :vinyls do
    resources :offers
  end
 
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

    devise_scope :user do  
      get '/users/sign_out' => 'devise/sessions#destroy'     
    end
  
  root to: "home#index"

  get '/users/:user_id/my_swaps/offers', to: 'offers#swapped_vinyls', as: 'my_swaps'
  get '/users/:user_id/offers', to: 'offers#user_offers', as: 'my_offers'
  delete '/vinyls/:vinyl_id/offers/:id', to: 'offers#destroy', as: 'destroy'
  get "users_list", to: "home#users"
  get "vinylslist", to: "shared#vinyls"
  get "dashboard", to: "home#dashboard"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
