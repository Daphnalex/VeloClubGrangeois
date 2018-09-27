class AddAttachmentImageOneToHomePictures < ActiveRecord::Migration[5.2]
  def self.up
    change_table :home_pictures do |t|
      t.attachment :image_one
      t.attachment :image_two
      t.attachment :image_three
      t.attachment :image_four
    end
  end

  def change
    remove_column :home_pictures, :pictures
    remove_column :home_pictures, :order
  end

  def self.down
    remove_attachment :home_pictures, :image_one
    remove_attachment :home_pictures, :image_two
    remove_attachment :home_pictures, :image_three
    remove_attachment :home_pictures, :image_four
  end
end
