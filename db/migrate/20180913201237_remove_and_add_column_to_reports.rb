class RemoveAndAddColumnToReports < ActiveRecord::Migration[5.2]
  def self.up
    change_table :reports do |t|
      t.attachment :document
    end
  end
end
