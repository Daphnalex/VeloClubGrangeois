class AddColumnSliderToStock < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :slider, :boolean, default: false
  end
end
