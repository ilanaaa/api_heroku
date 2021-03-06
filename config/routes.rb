require 'resque/server'
Rails.application.routes.draw do
  ApiProject::Application.routes.draw do
    mount Resque::Server.new, at: "/resque"
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # Example of regular route:
  get 'ipad_ratings/get_data' => 'ipad_ratings#get_data'
  get 'ipad_ratings/save_to_db' => 'ipad_ratings#save_to_db'
  #get 'ipad_ratings/self.perform' => 'ipad_ratings#self.perform'
  get 'ipad_ratings/show' => 'ipad_ratings#show'
  get 'iphone_ratings/get_data' => 'iphone_ratings#get_data'
  get 'iphone_ratings/save_to_db' => 'iphone_ratings#save_to_db'
  get 'iphone_ratings/show' => 'iphone_ratings#show'
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
