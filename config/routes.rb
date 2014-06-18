Rails.application.routes.draw do

  get 'session/login'

  get 'session/login_attempt'

  get 'session/logout'

  get "login", to: "session#login"
  
  post "login", to: "session#login_attempt"
  
  get "logout", to: "session#logout" 

  get "admin", to: "admin#index"
  namespace :admin do
    resources :cohorts
    resources :enrollments
    resources :users
    resources :invites
  end

  get "register", to: "users#new"

  match '/', to: 'schools#index', constraints: { subdomain: /www/ }, via: [:get, :post]
  match '/', to: 'schools#show', constraints: { subdomain: /.+/ }, via: [:get, :post]
  root to: "schools#index"

  resources :schools, :tasks, :comments, :submissions, :users
  
  # Limit the actions on public enrollments and cohort actions to 
  # only list all items (index) or just view a specific item (show).
  resources :enrollments, only: [:index, :show]
  resources :cohorts, only: [:index, :show]

  resources :units do
    resources :tasks
  end

  #Allow all actions for namespaced controllers users, cohorts, and enrollments.
  namespace :admin do
    resources :users, :cohorts, :enrollments
    
    # If we don't want /admin/cohorts in the url,
    # we can use the following:
    # scope module: 'admin' do
    ## resources :users, :cohorts, :enrollments
    ## end

    # I'm not sure if we need the following 3 commands but 
    # I found them in the docs. Keeping them here as a plan b. -Bryan
    
    # Directs /admin/users/* to Admin::UsersController
    #   (app/controllers/admin/users_controller.rb)
  
    # Directs /admin/cohorts/* to Admin::CohortsController
    #   (app/controllers/admin/cohorts_controller.rb)

    # Directs /admin/enrollments/* to Admin::EnrollmentsController
    #   (app/controllers/admin/enrollments_controller.rb)    
  end


  #TESTING

  # assert_generates '/admin/users/1', { controller: 'admin::users', action: 'show', id: '1'}
  # assert_generates '/admin/users/1/edit', { controller: 'admin::users', action: 'edit', id: '1'}

  # assert_generates '/admin/cohorts/1', { controller: 'admin::cohorts', action: 'show', id: '1'}
  # assert_generates '/admin/cohorts/1/edit', { controller: 'admin::cohorts', action: 'edit', id: '1'}

  # assert_generates '/admin/enrollments/1', { controller: 'admin::enrollments', action: 'show', id: '1'}
  # assert_generates '/admin/enrollments/1/edit', { controller: 'admin::enrollments', action: 'edit', id: '1'}






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
end
