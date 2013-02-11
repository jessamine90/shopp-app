ShopApp::Application.routes.draw do
  resource :shop 
  resource :order
  root :to => "shop#index"
  resources :products
  resources :categories
  resources :order_items
  
  scope '/admin' do
    devise_for :admin_users
  end
  
  namespace :admin do
    root :to => 'admin#index'
 	resources :orders
 	resources :categories
 	resources :products
	match 'admin_root' => "admin#index"
  end 
  
  match '/categories/:id' => "categories#show"
  match 'cart' => "order#index"
  match 'cart/add/:id' => "order#add"
  match 'cart/delete/:id' => "order#delete"
  match 'cart/checkout' => "order#checkout"

  match 'search/results' => "search#results"
  
  resource :spa
  match 'spa' => 'spas#show'
  match 'spa/get_categories' => "spas#get_categories"
  match 'spa/get_products' => "spas#get_products"

end
