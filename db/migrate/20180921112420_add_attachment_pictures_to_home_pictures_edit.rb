class AddAttachmentPicturesToHomePicturesEdit < ActiveRecord::Migration[5.2]
  def up
    add_attachment :home_pictures, :pictures
  end

  def down
    remove_attachment :home_pictures, :pictures
  end
end
