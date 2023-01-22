class ChangeColumnToItemCustomerOrderAddress < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :sale_status, from: false, to: true
    rename_column :addresses, :addresses, :address
    change_column_default :orders, :payment_method, from: nil, to: 0
    change_column_default :customers, :is_deleted, from: nil, to: false
  end
end
