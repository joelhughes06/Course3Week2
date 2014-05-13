Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: 'pages#front'

#  root to: 'todos#index'

  #get '/titles', to: 'titles#index'
  #get '/show', to: 'titles#show'

  #get '/show/:id(.:format)', to: 'titles#show'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
#  resources :titles, except: [:destroy]
 # resources :todos, except: [:destroy]
  resources :todos, only: [:index] do 
    collection do 
      get 'search', to: 'todo#search'
    end
  
    member do 
      post 'highlight', to: 'todos#highlight'
    end
  end

  resources :categories, except: [:destroy]

  resources :titles, except: [:destroy] do 
    collection do 
      get :search, to: "titles#search"
    end
    get 'sign_in', to: "titles#index"
  end

  resources :titles, only: [:show] do
    collection do
      post :search, to: "titles#search"
    end 
  end

  resources :users, except: [:destroy] do
      get :sign_in, to: "users#sign_in"
      post :sign_in, to: "titles#index"
    end

  get "register", to: "users#new"

  get "sign_in", to: "sessions#new"
  get 'sign_out', to: "sessions#destroy"
  get "home", to: "titles#index"

  resources :sessions, only: [:create]


  #get "sign_in", to: "users#sign_in"

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
