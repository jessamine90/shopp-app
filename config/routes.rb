ShopApp::Application.routes.draw do
  root :to => "shop#index"
  resources :products
  resources :categories
  match 'search/results' => "search#results"
  
end
