class CustomersController < AuthenticatedController
  skip_before_action :verify_authenticity_token
  before_action :set_customer, only: [:edit, :update]
  # around_action :setup_shopify_site

  # before_action :clear_and_setup_shopify_site

  # def clear_and_setup_shopify_site
  #   config = Rails.application.credentials.shopify_api
  #   ShopifyAPI::Base.clear_session
  #   ShopifyAPI::Base.site = "https://#{config[:api_key]}:#{config[:password]}@#{store_name}.myshopify.com/admin"
  # end

  # def setup_shopify_site
  #   begin
  #     api_key = ENV['api_key']
  #     api_secret = ENV['api_secret']
  #     store_name=Shop.first.shopify_domain
  #     ShopifyAPI::Base.site = "https://{api_key}:{api_secret]}@{store_name}/admin"
  #     yield
  #   ensure
  #     ShopifyAPI::Base.clear_session
  #   end
  # end

  # def setup_shopify_site
  #   shop_url = "https://#{ENV['api_key']}:#{ENV['api_secret']}@SHOP_NAME.myshopify.com/admin"
  #   ShopifyAPI::Base.site = shop_url
  # end
  

  def index
    @customers = ShopifyAPI::Customer.find(:all)
  end

  def created_customers
    @customers = Customer.all
  end

  def custom_index
    @customers = ShopifyAPI::Customer.find(:all)
  end

  def show
      @customer = ShopifyAPI::Customer.find(params[:id])
  end

  def error_page
  end

  def create
    @customer = Customer.new(params[:customer])
    @customer.cid = params[:cid]
    @customer.created_at = params[:created_at]
    @customer.fname = params[:fname]
    @customer.lname = params[:lname]
    @customer.email_id = params[:email_id]
    @customer.phone = params[:phone]
    @customer.address = params[:address]
    @customer.city = params[:city]
    @customer.state = params[:state]
    @customer.zip = params[:zip]
    @customer.gender = params[:gender]
    @customer.ins_comp = params[:ins_comp]
    @customer.ins_num = params[:ins_num]
    @customer.provider = params[:provider]
    @customer.card_num = params[:card_num]
    @customer.exp_date = params[:exp_date]
   
     if @customer.save
       flash[:success] = "Customer created successfully."
       redirect_to customers_created_customers_path
     else
      flash[:alert] = "Error creating customer"
       redirect_to customers_error_page_path
     end
  end

  def new
  end

  def update

    @customer.cid = params[:cid]
    @customer.created_at = params[:created_at]
    @customer.fname = params[:fname]
    @customer.lname = params[:lname]
    @customer.email_id = params[:email_id]
    @customer.phone = params[:phone]
    @customer.address = params[:address]
    @customer.city = params[:city]
    @customer.state = params[:state]
    @customer.zip = params[:zip]
    @customer.gender = params[:gender]
    @customer.ins_comp = params[:ins_comp]
    @customer.ins_num = params[:ins_num]
    @customer.provider = params[:provider]
    @customer.card_num = params[:card_num]
    @customer.exp_date = params[:exp_date]

    if @customer.save
      flash[:success] = "Customer created successfully."
      redirect_to customers_created_customers_path
    else
     flash[:alert] = "Error creating customer"
      redirect_to customers_error_page_path
    end

  end

  def destroy
    @customer = Customer.where(cid: params[:id]).first
    @customer.destroy
    redirect_to customers_created_customers_path
  end

  private

  def set_customer
    @customer = Customer.where(cid: params[:id]).first
  end

end
