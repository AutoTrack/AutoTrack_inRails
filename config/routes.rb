Rails.application.routes.draw do

  get 'business_user', to: 'business_users#business_user_index'
  post 'business_user_register', to: 'business_users#business_register'
  post 'business_user_login', to: 'business_users#business_login'

  # root to: 'home#index'
  get 'employee_user_index', to: 'employee_users#employees_index'
  post 'employee_user_register', to: 'employee_users#employee_register'
  post 'employee_user_login', to: 'employee_users#employee_login'
  post 'employee_user_pin_login', to: 'employee_users#employee_pin_login'

#--------------------------Client-Routes--------------------------------#

get 'clients', to: 'clients#clients_index'
post 'clients', to: 'clients#clients_create'
get 'client/:id', to: 'clients#client_show'
patch 'client/:id', to: 'clients#client_update'
delete 'client/:id', to: 'clients#client_destroy'

#------------------------InvetoryItems-Routes------------------------#

get 'inventory_items', to: 'inventory_items#inventory_items_all'
post 'inventory_items', to: 'inventory_items#inventory_items_create'
get 'inventory_item/:id', to: 'inventory_items#inventory_item_show'
patch 'inventory_item/:id', to: 'inventory_items#inventory_item_update'
delete 'inventory_item/:id', to: 'inventory_items#inventory_item_destroy'

#-------------------------Vehicles-Routes-----------------------------#
get 'vehicles', to: 'vehicles#vehicles_all'
post 'vehicles', to: 'vehicles#vehicles_create'
get 'vehicle/:id', to: 'vehicles#vehicle_show'
patch 'vehicle/:id', to: 'vehicles#vehicle_update'
delete 'vehicle/:id', to: 'vehicles#vehicle_destroy'


#--------------------------RepairOrder-Routes--------------------------------#

get 'repair_orders', to: 'repair_orders#repair_orders_index'
post 'repair_order', to: 'repair_orders#repair_order_create'
get 'repair_order/:id', to: 'repair_orders#repair_order_show'
patch 'repair_order/:id', to: 'repair_orders#repair_order_update'
delete 'repair_order/:id', to: 'repair_orders#repair_order_destroy'
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
