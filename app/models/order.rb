class Order < ApplicationRecord
    has_many :order_products, dependent: :delete_all
end
