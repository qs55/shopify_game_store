class Product < ApplicationRecord
    has_many :product_variations, dependent: :delete_all
    has_many :variation_types, dependent: :delete_all
end
