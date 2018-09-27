class AddAttachmentListImagesToHomePictures < ActiveRecord::Migration[5.2]
  def up
    add_attachment :home_pictures, :image_one
    add_attachment :home_pictures, :image_two
    add_attachment :home_pictures, :image_three
    add_attachment :home_pictures, :image_four
  end

  def down
    remove_attachment :home_pictures, :image_one
    remove_attachment :home_pictures, :image_two
    remove_attachment :home_pictures, :image_three
    remove_attachment :home_pictures, :image_four
  end
end
