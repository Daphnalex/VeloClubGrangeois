class RenameTableHomePictures < ActiveRecord::Migration[5.2]
  def change
    rename_table :home_pictures, :pictures
  end
end
