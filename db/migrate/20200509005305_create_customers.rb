class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :cid
      t.string :fname
      t.string :lname
      t.string :created_at
      t.string :email_id
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :gender
      t.string :ins_comp
      t.string :ins_num
      t.string :provider
      t.string :card_num
      t.string :exp_date
      t.string :string

      t.timestamps
    end
    add_index :customers, :cid, :unique => true
  end
end
