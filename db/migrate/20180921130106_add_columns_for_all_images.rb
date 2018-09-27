class AddColumnsForAllImages < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :image_one, :text
    add_column :pictures, :image_two, :text
    add_column :pictures, :image_three, :text
    add_column :pictures, :image_four, :text 
  end
end
