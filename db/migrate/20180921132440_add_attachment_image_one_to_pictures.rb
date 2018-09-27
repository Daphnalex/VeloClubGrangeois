class AddAttachmentImageOneToPictures < ActiveRecord::Migration[5.2]
  def self.up
    change_table :pictures do |t|
      t.attachment :image_one
      t.attachment :image_two
      t.attachment :image_three
      t.attachment :image_four
    end
  end

  def self.down
    remove_attachment :pictures, :image_one
    remove_attachment :pictures, :image_two
    remove_attachment :pictures, :image_three
    remove_attachment :pictures, :image_four
  end
end
