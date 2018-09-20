class AddColumnTypeOfArticleAndExitAndStock < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :type, :string, default: "article"
    add_column :exits, :type, :string, default: "exit"
    add_column :stocks, :type, :string, default: "stock"
  end
end
