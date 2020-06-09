class ProxyController < ApplicationController
  include ShopifyApp::AppProxyVerification
  def index
    # render layout: false, content_type: 'application/liquid'
    # if params[:pv].present?
      

    # elsif params[:vt].present?

    # else

    # end



    # @customer = Customer.last
    # render json: @customer

    products = ""
    product_variations = ""
    variation_types = ""

    if params[:gt].present?
      @products = Product.all
      products = ""
      @products.each do |product|
        products = products + product.lense + ","
      end
    
    elsif params[:pv].present?
      if params[:pv] == "Digital"
        @product = Product.where(:lense => "Digital").first
        @product_variations = @product.product_variations
        product_variations = ""
        @product_variations.each do |pv|
          product_variations = product_variations + pv.variation + ","
        end
      
      else
        @product = Product.where(:lense => "Non-Digital").first
        @product_variations = @product.product_variations
        product_variations = ""
        @product_variations.each do |pv|
          product_variations = product_variations + pv.variation + ","
        end
      end
    
    else

      if params[:vt] == "Digital"
        @product = Product.where(:lense => "Digital").first
        @variation_types = @product.variation_types
        variation_types = ""
        @variation_types.each do |vt|
          variation_types = variation_types + vt.material + ","
        end
      
      else
        @product = Product.where(:lense => "Non-Digital").first
        @variation_types = @product.variation_types
        variation_types = ""
        @variation_types.each do |vt|
          variation_types = variation_types + vt.material + ","
        end
      end


    end



    # @products = Product.all
    # @product_variations = ProductVariation.all
    # @variation_types = VariationType.all
    # # render json: @products
    # render json: { products: @products, product_variation: @product_variations, variation_type: @variation_types }, status: :ok
    render json: { products: products, product_variation: product_variations, variation_type: variation_types }

  end
end
