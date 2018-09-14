class AddAttachmentDocumentToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :document
  end

  def self.up
    change_table :reports do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :reports, :document
  end
end
