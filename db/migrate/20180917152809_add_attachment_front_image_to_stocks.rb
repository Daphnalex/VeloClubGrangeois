class AddAttachmentFrontImageToStocks < ActiveRecord::Migration[5.2]
  def self.up
    change_table :stocks do |t|
      t.attachment :front_image
    end
  end

  def self.down
    remove_attachment :stocks, :front_image
  end
end
