class ChangeColumnToCustomer < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :pastal_code, :postal_code

  end
end
