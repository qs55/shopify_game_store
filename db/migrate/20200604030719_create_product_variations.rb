class CreateProductVariations < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variations do |t|
      t.references :product, index: true, foreign_key: true
      t.string :variation
      t.integer :price

      t.timestamps
    end
  end
end
