class AddTablePresentations < ActiveRecord::Migration[5.2]
  def change
    create_table :presentations do |t|
      t.text :content

      t.timestamps
    end
  end
end
