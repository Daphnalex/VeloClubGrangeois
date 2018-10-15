class AddColumRightsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rights, :string
  end
end
