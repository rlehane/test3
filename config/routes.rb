Rails.application.routes.draw do


  resources :jobs do
      resources :notes, except: [:show, :index]
  end

  get 'dash/index'

  resources :charities

  # root 'charities#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'user_show', to: 'users#show', as: 'user_show'
  get 'vols_menu', to: 'users#menu', as: 'vols_menu'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'volunteers', to: 'pages#volMenu', as: 'volunteers'
  get 'charities_menu', to: 'pages#charMenu', as: 'charities_menu'
  # get 'about', to: 'pages/landing#about-us', as: 'about' 
  get 'charForm', to: 'charity#form', as: 'charForm'
  get 'register', to: 'charity#form', as: 'register'
  get 'noticeboard', to: 'jobs#index', as: 'noticeboard'
  # get 'profile', to: 'users#show.current_user', as: 'profile'
  resources :users
  
  root 'pages#landing'

  get 'tags/:tag', to: 'users#menu', as: :tag

  get 'pages/volMenu'

  get 'charity/form'

  
  # get 'pages/login'

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
