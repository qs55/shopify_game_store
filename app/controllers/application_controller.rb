class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning, :alert
  protect_from_forgery with: :exception
end
