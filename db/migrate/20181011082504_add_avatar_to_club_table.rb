class AddAvatarToClubTable < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :avatar, :string
  end
end
