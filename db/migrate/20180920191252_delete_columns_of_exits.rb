class DeleteColumnsOfExits < ActiveRecord::Migration[5.2]
  def change
    remove_column :exits, :type
    remove_column :exits, :slider
  end
end
