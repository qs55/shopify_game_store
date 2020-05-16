class CreateOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.references :order, index: true, foreign_key: true
      t.string :pid
      t.string :pname
      t.integer :quantity
      t.string :line1
      t.string :line2
      t.string :line3

      t.timestamps
      t.timestamps
    end
  end
end
