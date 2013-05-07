class ChagngeAllTables < ActiveRecord::Migration
  def up
    remove_column :line_items, :message
    remove_column :orders, :product_id
    remove_column :orders, :quantity
    add_column :orders, :state, :string
  end

  def down
  end
end
