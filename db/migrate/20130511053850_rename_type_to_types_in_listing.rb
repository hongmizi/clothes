class RenameTypeToTypesInListing < ActiveRecord::Migration
  def up
    rename_column :listings, :type, :types
  end

  def down
  end
end
