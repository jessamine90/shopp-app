ShopApp::Application.routes.draw do

  root :to => "shop#index"
  resource :shop
  resources :products
  resources :categories
  
  resources :orders do
    collection do
      post 'finalize'
      post 'add_item'
      get 'confirm'
    end
  end
  
  namespace :admin do
	devise_for :admin_users
	resources :products
	resources :categories
	root :to => "orders#index"
  end
  
end
