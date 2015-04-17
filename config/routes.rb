Rails.application.routes.draw do

  get 'dashboard', to: 'dashboard#main'
  get 'dashboard/team', to: 'dashboard#team'

  get 'sign_up', to: 'companies#new'
  resources :companies, only: [:create]
  
  devise_for :users, controllers: {registrations: 'users/registrations'}

  resources :user, only: [:new, :create, :update, :destroy]

  #get '/users/edit', to: 'users/registrations#edit', as: :edit_user_registration
  #patch '/users', to: 'users/registrations#update', as: :edit_user_registration
  #put '/users', to: 'users/registrations#update', as: :edit_user_registration
  #post 'user_registration', to: 'users/registrations#create'
  #get '/users/edit', to: 'users/registrations#edit'

  resources :postings do
    resources :forms
  end

  resources :categories, only: [:create] do
    resources :fields, only: [:create]
  end

  get "forms/new/:active", to: "forms#new"

  authenticated :user do
    root "dashboard#main", as: "authenticated_root"
  end

  unauthenticated do
    root "static_pages#landing"
  end
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
