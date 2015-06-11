class CreateTextures < ActiveRecord::Migration
  def change
    create_table :textures do |t|
      t.integer :score, default: 0
      t.integer :user_id
      t.integer :item_id
      t.text :content
      t.timestamps
    end
  end
end
