class CustomWebhooksController < ApplicationController
    include ShopifyApp::WebhookVerification
    def orders_create
        params.permit!
        # SomeJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
        
        @order = Order.new
        @order.oid =  params[:id]
        @order.onum = params[:number]
        @order.cid =  params[:customer][:id]
        @order.cemail = params[:customer][:email]
        @order.cfname =  params[:customer][:first_name]
        @order.save

        params[:line_items].each do |item|
            @line_item = @order.order_products.new
            @line_item.pid = item[:id]
            @line_item.pname = item[:title]
            @line_item.quantity = item[:quantity].to_i
            
            index = 1
            item[:properties].each do |cust|
                if index == 1
                    @line_item.line1 =  cust[:name] + ":" + cust[:value]
                elsif index == 2
                    @line_item.line2 =  cust[:name] + ":" + cust[:value]
                else
                    @line_item.line3 =  cust[:name] + ":" + cust[:value]
                end
                
                index = index + 1
            end
            @line_item.save
        end

        # puts "*" * 500
        # puts params[:id]
        # puts params[:number]
        # puts params[:customer][:id]
        # puts params[:customer][:email]
        # puts params[:customer][:first_name]
        # puts "*" * 500

        # params[:line_items].each do |item|
        #     puts item[:id]
        #     puts item[:title]
        #     puts item[:quantity]
            
        #     item[:properties].each do |cust|
        #         puts cust[:name] + ":" + cust[:value]
        #     end
        # end
        


        head :ok
    end
  
    def orders_update
    end
  
    def orders_paid
    end

    private
    def webhook_params
    params.except(:controller, :action, :type)
    end
  
end
