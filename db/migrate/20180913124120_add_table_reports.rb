class AddTableReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      ##User informations
      t.string :title
      t.string :file
    end
  end
end
