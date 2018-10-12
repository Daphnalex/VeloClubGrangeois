class DeleteColumToClub < ActiveRecord::Migration[5.2]
  def change
    remove_column :clubs, :presentation
  end
end
