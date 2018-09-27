class CreateTablePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.text :image_one
      t.text :image_two
      t.text :image_three
      t.text :image_four
    end
  end
end
