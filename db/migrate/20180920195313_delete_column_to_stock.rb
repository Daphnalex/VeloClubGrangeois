class DeleteColumnToStock < ActiveRecord::Migration[5.2]
  def change
    remove_column :stocks, :type_of_data
    remove_column :stocks, :slider
  end
end
