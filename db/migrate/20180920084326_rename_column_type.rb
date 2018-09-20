class RenameColumnType < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :type, :type_of_data
    rename_column :exits, :type, :type_of_data
    rename_column :stocks, :type,  :type_of_data
  end
end
