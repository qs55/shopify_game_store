class ProxyController < ApplicationController
  include ShopifyApp::AppProxyVerification
  def index
    @customer = Customer.last
    render json: @customer
  end
end
