ShopApp::Application.routes.draw do

  root :to => "shop#index"
  resource :shop
  resources :products
  resources :categories
  
  namespace :admin do
	devise_for :admin_users
	resources :products
	resources :categories
	root :to => "orders#index"
  end
  
end
