class AddAttachmentBackImageToStocks < ActiveRecord::Migration[5.2]
  def self.up
    change_table :stocks do |t|
      t.attachment :back_image
    end
  end

  def self.down
    remove_attachment :stocks, :back_image
  end
end
