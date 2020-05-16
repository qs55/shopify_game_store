class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :oid
      t.string :onum
      t.string :cid
      t.string :cfname
      t.string :cemail

      t.timestamps
    end
    add_index :orders, :oid, :unique => true
  end
end
