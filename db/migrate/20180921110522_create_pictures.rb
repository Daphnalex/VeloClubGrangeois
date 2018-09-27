class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :home_pictures do |t|

      t.timestamps
    end
  end
end
