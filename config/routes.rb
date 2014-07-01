Rails.application.routes.draw do

  
  # SUBDOMAIN as root
  match '/', to: 'pages#splash_page', constraints: { subdomain: /www/ }, via: [:get, :post]
  match '/', to: 'schools#show', constraints: { subdomain: /.+/ }, via: [:get, :post]
  root to: 'pages#splash_page'

  # SESSION routes
  get "login", to: "session#login"
  post "login", to: "session#login_attempt"
  get "logout", to: "session#logout" 

  # ADMIN routes
  get "admin", to: "admin#dashboard"
  namespace :admin do
    resources :cohorts
    resources :enrollments
    resources :users
    resources :invites
    resources :schools, only: [:edit, :update]
  end

  # REGISTRATION routes
  get "register", to: "users#new"
  post "users", to: "users#create"

  resources :tasks
  resources :comments
  resources :submissions#, only: [:update, :destroy, :edit, :show]
  resources :users
  
  # Limit the actions on public enrollments and cohort actions to 
  # only list all items (index) or just view a specific item (show).
  resources :enrollments, only: [:index, :show]
  resources :cohorts, only: [:index, :show]

  resources :cohorts do
    resources :units 
    resources :submissions, only: [:index]
  end

  resources :units do
    resources :tasks
  end

  resources :tasks do
    resources :submissions, only: [:new, :create]
  end
  
  get '/profile', to: 'users#show'

end
