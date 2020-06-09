class ChangeCustomizationsColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :order_products, :line1, :glass_type
    rename_column :order_products, :line2, :lense_type
    rename_column :order_products, :line3, :glass_material
  end
end
