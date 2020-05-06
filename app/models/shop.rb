class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage
end

def api_version
  ShopifyApp.configuration.api_version
end