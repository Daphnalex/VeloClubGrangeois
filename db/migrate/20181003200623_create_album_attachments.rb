class CreateAlbumAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :album_attachments do |t|
      t.integer :album_id
      t.string :picture

      t.timestamps
    end
  end
end
