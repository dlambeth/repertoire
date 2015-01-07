class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :title
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :items, [:user_id, :created_at]
  end
end