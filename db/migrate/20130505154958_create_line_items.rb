class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :listing_id
      t.integer :order_id
      t.decimal :price, precision:8, scale:2
      t.integer :quantity
      t.text :message

      t.timestamps
    end
  end
end
