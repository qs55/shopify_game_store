Rails.application.routes.draw do

  get 'proxy/index'

  get 'customers/index'
  get 'customers/error_page'
  match 'customers/custom_index', :to => 'customers#custom_index', :via => [:get]
  match 'customers/created_customers', :to => 'customers#created_customers', :via => [:get]
  resources :apps
  resources :customers


  get 'home/index'
  
  root :to => 'proxy#index'
  mount ShopifyApp::Engine, at: '/'

  namespace :app_proxy do
    root action: 'index'
    # simple routes without a specified controller will go to AppProxyController
    
    # more complex routes will go to controllers in the AppProxy namespace
    # 	resources :reviews
    # GET /app_proxy/reviews will now be routed to
    # AppProxy::ReviewsController#index, for example
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
