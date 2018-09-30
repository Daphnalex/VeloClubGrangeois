class AddPromoTextToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :promotion, :text
  end
end
