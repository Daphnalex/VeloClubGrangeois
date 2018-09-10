class EditPhoneNumberIntegerToString < ActiveRecord::Migration[5.2]
  def change
    change_column :clubs, :telephone, :string
    rename_column :clubs, :telephone, :phone
  end
end
