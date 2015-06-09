class CreateTastes < ActiveRecord::Migration
  def change
    create_table :tastes do |t|
      t.text :content
      t.timestamps
    end
  end
end
