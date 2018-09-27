class AddAttachmentPicturesToHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :home_pictures do |t|
      t.timestamps
    end
  end

  def self.up
    change_table :home_pictures do |t|
      t.attachment :pictures
    end
  end

  def self.down
    remove_attachment :home_pictures, :pictures
  end
end
