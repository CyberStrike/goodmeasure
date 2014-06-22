Rails.application.routes.draw do

  # SUBDOMAIN as root
  match '/', to: 'schools#index', constraints: { subdomain: /www/ }, via: [:get, :post]
  match '/', to: 'schools#show', constraints: { subdomain: /.+/ }, via: [:get, :post]
  root to: "schools#index"

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
  end

  # REGISTRATION routes
  get "register", to: "users#new"
  post "users", to: "users#create"

  resources :tasks
  resources :comments
  resources :submissions
  resources :users
  
  # Limit the actions on public enrollments and cohort actions to 
  # only list all items (index) or just view a specific item (show).
  resources :enrollments, only: [:index, :show]
  resources :cohorts, only: [:index, :show]

  resources :units do
    resources :tasks
  end

  resources :cohorts do 
    resources :units 
  end

  #TESTING

  # assert_generates '/admin/users/1', { controller: 'admin::users', action: 'show', id: '1'}
  # assert_generates '/admin/users/1/edit', { controller: 'admin::users', action: 'edit', id: '1'}

  # assert_generates '/admin/cohorts/1', { controller: 'admin::cohorts', action: 'show', id: '1'}
  # assert_generates '/admin/cohorts/1/edit', { controller: 'admin::cohorts', action: 'edit', id: '1'}

  # assert_generates '/admin/enrollments/1', { controller: 'admin::enrollments', action: 'show', id: '1'}
  # assert_generates '/admin/enrollments/1/edit', { controller: 'admin::enrollments', action: 'edit', id: '1'}

end
