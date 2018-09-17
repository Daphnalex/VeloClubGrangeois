class Stocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      ##User informations
      t.string :title
      t.integer :quantity
    end
  end
end
