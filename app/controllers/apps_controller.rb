class AppsController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
  end

  def show
    @product = ShopifyAPI::Product.find(params[:id])
  end
end
