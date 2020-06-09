class CreateVariationTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :variation_types do |t|
      t.references :product
      t.string :material
      t.integer :price

      t.timestamps
    end
  end
end
