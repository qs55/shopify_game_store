class CustomersController < AuthenticatedController
  def index
    @customers = ShopifyAPI::Customer.find(:all)
  end

  def custom_index
    @customers = ShopifyAPI::Customer.find(:all)
  end

  def show

  end
end
