class RemoveTablePresentations < ActiveRecord::Migration[5.2]
  def change
    drop_table :presentations
  end
end
