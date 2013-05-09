class UsePolymorphicForLineItem < ActiveRecord::Migration
  def up
    rename_column :line_items, :order_id, :referable_id
    add_column :line_items, :referable_type, :string
  end

  def down
  end
end
