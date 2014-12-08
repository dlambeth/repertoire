class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :my_list_id
      t.integer :item_id
      t.integer :order

      t.timestamps null: false
    end
    add_index :list_items, :my_list_id
    add_index :list_items, :item_id
    add_index :list_items, [:my_list_id, :item_id], unique: true
  end
end
