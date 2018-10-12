class AddDescriptionToClub < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :presentation, :text
  end
end
