class ProxyController < ApplicationController
  def index
    @customer = Customer.first
    render json: @customer
  end
end
