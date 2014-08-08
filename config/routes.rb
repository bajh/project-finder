Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root 'projects#index'

  resources :messages, only: :create
  resources :projects, only: [:show, :edit, :create, :new]
  post 'approve_collaboration' => 'user_projects#approve_collaboration', as: "approve_collaboration"  
  post 'deny_collaboration' => 'user_projects#deny_collaboration', as: "deny_collaboration"  
  post 'apply_for_project' => 'user_projects#apply_for_project', as: 'apply_for_project'
  post 'invite' => 'user_projects#invite', as: 'invite'
  post 'update' => 'user_projects#update', as: 'update'
  get '/about' => 'application#about', as: "about"

end
