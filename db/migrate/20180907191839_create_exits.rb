class CreateExits < ActiveRecord::Migration[5.2]
  def change
    create_table :exits do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.string :city

      t.timestamps
    end
  end
end
