class AddAttachmentPicturesToHomePictures < ActiveRecord::Migration[5.2]
  def self.up
    change_table :home_pictures do |t|
      t.attachment :pictures
    end
  end

  def self.down
    remove_attachment :home_pictures, :pictures
  end

  def change
    add_column :home_pictures, :order_picture, :integer
  end
end
