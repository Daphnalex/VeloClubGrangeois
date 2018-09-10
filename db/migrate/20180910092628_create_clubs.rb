class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :title
      t.string :name
      t.integer :telephone
      t.string :mail
      t.timestamps
    end
  end
end
