class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :product_id
      t.string :color
      t.string :size
      t.integer :stock, default:0

      t.timestamps
    end
  end
end
