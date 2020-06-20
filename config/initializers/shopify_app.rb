ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = ENV['api_key']
  config.secret = ENV['api_secret']
  config.old_secret = "<old_secret>"
  config.scope = "read_products, read_customers, read_orders, write_orders" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = false
  config.after_authenticate_job = false
  config.session_repository = Shop

  config.webhooks = [
    {topic: 'orders/create', address: 'https://2c1f642e681b.ngrok.io/webhooks/orders_create', format: 'json'},
    {topic: 'orders/updated', address: 'https://2c1f642e681b.ngrok.io/webhooks/orders_update', format: 'json'},
    {topic: 'orders/paid', address: 'https://2c1f642e681b.ngrok.io/webhooks/orders_paid', format: 'json'}
  ]

end
