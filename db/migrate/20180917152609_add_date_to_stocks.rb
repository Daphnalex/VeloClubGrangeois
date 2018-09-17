class AddDateToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :date, :datetime
  end
end
