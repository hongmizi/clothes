class ChangeListing < ActiveRecord::Migration
  def up
    remove_column :listings, :color
    remove_column :listings, :size
    add_column :listings, :type, :string
  end

  def down
  end
end
