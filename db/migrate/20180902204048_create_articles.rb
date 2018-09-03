class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :picture
      t.text :resume
      t.datetime :date
      t.text :content
      t.string :author

      t.timestamps
    end
  end
end
