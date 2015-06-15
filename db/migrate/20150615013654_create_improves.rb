class CreateImproves < ActiveRecord::Migration
  def change
    create_table :improves do |t|
      t.string :visual
      t.string :texture
      t.string :flavor
      t.string :portion
      t.string :aroma
      t.timestamps
    end
  end
end
