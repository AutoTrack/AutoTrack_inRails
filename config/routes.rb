Rails.application.routes.draw do

  root to: 'home#index'
  get 'business_user/index', to: 'business_users#index'
  post 'business_user/register', to: 'business_users#business_register'
  post 'business_user/login', to: 'business_users#business_login'

  get 'employee_user/index', to: 'employee_users#index'
  get 'employee_user/business_index', to: 'employee_users#index_by_business'
  post 'employee_user/sregister', to: 'employee_users#super_employee_register'
  post 'employee_user/register', to: 'employee_users#employee_register'
  post 'employee_user/login', to: 'employee_users#employee_login'
  post 'employee_user/pin_login', to: 'employee_users#employee_pin_login'
  patch 'employee_user/update/:id', to: 'employee_users#update_employee_user'
  delete 'employee_user/delete/:id', to: 'employee_users#delete_employee_user'
  get 'employee_user/show/:id', to: 'employee_users#show_employee_user'

#--------------------------Client-Routes--------------------------------#

get 'clients', to: 'clients#clients_index'
get 'clients/business_user', to: 'clients#business_clients_index'
get 'clients/employee_user/:id', to: 'clients#employee_clients_index'
post 'clients', to: 'clients#clients_create'
get 'client/:id', to: 'clients#client_show'
patch 'client/:id', to: 'clients#client_update'
delete 'client/:id', to: 'clients#client_destroy'

#--------------------------RepairOrder-Routes--------------------------------#

get 'repair_orders', to: 'repair_orders#repair_orders_index'
get 'repair_orders/business_user', to: 'repair_orders#business_repair_orders_index'
get 'repair_orders/employee_user/:id', to: 'repair_orders#employee_repair_orders_index'
post 'repair_order', to: 'repair_orders#repair_order_create'
get 'repair_order/:id', to: 'repair_orders#repair_order_show'
patch 'repair_order/:id', to: 'repair_orders#repair_order_update'
delete 'repair_order/:id', to: 'repair_orders#repair_order_destroy'

#---------------------Repair_Orders_Employee_Users--------------------#

post 'employee_users_repair_order/attach_employee', to: 'employee_users_repair_orders#repair_order_employees_create'
get 'employee_users_repair_order/show_employees/:id', to: 'employee_users_repair_orders#repair_order_employees_show'

#-------------------------Vehicles-Routes-----------------------------#

get 'vehicles', to: 'vehicles#vehicles_index'
get 'vehicles/business_user', to: 'vehicles#business_vehicles_index'
get 'vehicles/employee_user/:id', to: 'vehicles#employee_vehicles_index'
post 'vehicles', to: 'vehicles#vehicles_create'
get 'vehicle/:id', to: 'vehicles#vehicle_show'
patch 'vehicle/:id', to: 'vehicles#vehicle_update'
delete 'vehicle/:id', to: 'vehicles#vehicle_destroy'


#------------------------InventoryItems-Routes------------------------#

get 'inventory_items', to: 'inventory_items#inventory_items_index'
get 'inventory_items/business_user', to: 'inventory_items#business_inventory_items_index'
post 'inventory_items', to: 'inventory_items#inventory_items_create'
get 'inventory_item/:id', to: 'inventory_items#inventory_item_show'
patch 'inventory_item/:id', to: 'inventory_items#inventory_item_update'
delete 'inventory_item/:id', to: 'inventory_items#inventory_item_destroy'

#----------------------Invoices-Routes---------------------------------#
# get 'invoices_all', to: 'invoices#invoices_all'
# post 'invoices', to: 'invoices#invoices_create'
# get 'invoice/:id', to:'invoices#invoice_show'
# patch 'invoice/:id', to: 'invoices#invoice_update'
# delete 'invoice/:id', to: 'invoices#invoices_delete'

#------------------------RepairItems-Routes------------------------#

post 'repair_item', to: 'repair_items#add_repair_item'
delete 'repair_item/:id', to: 'repair_items#remove_repair_item'
post 'repair_item/quantity', to: 'repair_items#add_repair_item_quantity'
patch 'repair_item/quantity', to: 'repair_items#update_repair_item_quantity'
get 'repair_items', to: 'repair_items#show_repair_items'
get 'repair_item/:id', to: 'repair_items#show_repair_item'
patch 'repair_items/checkout', to: 'repair_items#checkout_repair_items'

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
