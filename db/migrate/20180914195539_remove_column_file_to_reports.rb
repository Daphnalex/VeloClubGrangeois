class RemoveColumnFileToReports < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :file
  end
end
