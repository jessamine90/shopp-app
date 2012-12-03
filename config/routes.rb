ShopApp::Application.routes.draw do
  resource :shop 
  resource :order
  root :to => "shop#index"
  resources :products
  resources :categories
  resources :order_items
  
  match '/categories/:id' => "categories#show"
  match 'cart' => "order#index"
  match 'cart/add/:id' => "order#add"
  match 'cart/delete/:id' => "order#delete"
  match 'cart/checkout' => "order#checkout"

  match 'search/results' => "search#results"
end
