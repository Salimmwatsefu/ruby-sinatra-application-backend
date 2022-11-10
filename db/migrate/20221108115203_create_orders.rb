class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :product_name
      t.string :buyer_name
      t.integer :total
      t.timestamps
    end
  end
end
