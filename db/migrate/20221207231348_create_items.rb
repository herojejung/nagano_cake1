class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id,null: false, default: ""
      t.string :name, null: false, default: ""
      t.text :introduction, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.boolean :is_active, default: true,null: false
      t.timestamps
    end
  end
end
