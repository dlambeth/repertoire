class CreateMyLists < ActiveRecord::Migration
  def change
    create_table :my_lists do |t|
      t.text :title
      t.references :user, index: true

      t.timestamps null: false
    end

    add_index :my_lists, [:user_id, :created_at]
  end
end
