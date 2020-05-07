Rails.application.routes.draw do

  resources :apps


  get 'home/index'


  root :to => 'apps#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
