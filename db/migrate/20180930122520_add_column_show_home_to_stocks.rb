class AddColumnShowHomeToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :home, :boolean
  end
end
