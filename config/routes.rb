Rails.application.routes.draw do
 	
  get 'projects/index'
  get 'clients/index'
  devise_for :users

  namespace :admin do
    devise_for :users, only: :registration
  end

  resources :users do
    resources :clients, only: [ :new, :create ]
  end 

  resources :clients do
    resources :projects
  end

  resources :teams, only: [ :index, :show  ]

  resources :comments

  resources :projects, only: [ :index, :show, :destroy ]

  get '/give_manager_rights', to: "users#give_manager_rights"
  get '/disable_user', to: "users#disable_user"

  root to: "home#index"
  get 'home/index'
  
end
