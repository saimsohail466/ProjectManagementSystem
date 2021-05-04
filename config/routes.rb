Rails.application.routes.draw do
 	
  get 'projects/index'
  get 'clients/index'
  devise_for :users

  resources :users do
    resources :clients, only: [ :new, :create ]
  end 

  resources :clients do
    resources :projects
  end

  resources :projects, only: [ :index , :show, :destroy ]

  get '/give_manager_rights', to: "users#give_manager_rights"
  get '/disable_user', to: "users#disable_user"

  root to: "home#index"
  get 'home/index'
  
end
