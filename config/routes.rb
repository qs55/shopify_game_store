Rails.application.routes.draw do

  get 'customers/index'
  match 'customers/custom_index', :to => 'customers#custom_index', :via => [:get]
  resources :apps
  resources :customers


  get 'home/index'
  
  root :to => 'apps#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
