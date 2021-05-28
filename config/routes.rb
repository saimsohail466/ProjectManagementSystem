Rails.application.routes.draw do
  get 'projects/index'
  get 'clients/index'
  devise_for :users, controllers: {sessions: "sessions"}

  namespace :admin do
    resources :users, :projects
  end

  resources :users do
    resources :clients, only: [ :new, :create ]
  end 

  resources :clients do
    resources :projects
  end

  resources :teams, only: [ :index, :show  ]

  resources :comments

  resources :timelogs

  resources :projects, only: [ :index, :show, :destroy ] do
    resources :payments, except: :index
    resources :attachments
  end

  resources :attachments

  get 'admin/projects/:id/new_members', to: 'admin/projects#new_members', as: 'new_members'
  
  post 'admin/projects/:id/assign_members', to: 'admin/projects#assign_members', as: 'assign_members'
  get '/give_manager_rights', to: "admin/users#give_manager_rights"
  get '/change_user_status', to: "admin/users#change_user_status"

  root to: "home#index"
  get 'home/index'
end
