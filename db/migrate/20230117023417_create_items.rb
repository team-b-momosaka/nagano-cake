class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name , null: false
      t.text :item_text, null: false
      t.integer :no_tax_price, null: false
      t.boolean :sale_status, null: false, default: false
      t.integer :genre_id, null: false
      
      t.timestamps
    end
  end
end
