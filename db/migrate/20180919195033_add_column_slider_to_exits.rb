class AddColumnSliderToExits < ActiveRecord::Migration[5.2]
  def change
    add_column :exits, :slider, :boolean, default: false
  end
end
