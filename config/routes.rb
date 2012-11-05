ShopApp::Application.routes.draw do

  root :to => "shop#index"
  match 'search/results' => "search#results"
  resource :shop
  resources :products
  resources :categories
  
  resources :orders do
    collection do
      post 'finalize'
      post 'add_product'
      get 'confirm'
    end
  end
  
  resource :cart do
    post 'dodaj'
	put 'complete'
  end
  
  namespace :admin do
	devise_for :admin_users
	resources :products
	resources :categories
	root :to => "orders#index"
  end
end
