class AddItemIdToTastes < ActiveRecord::Migration
  def change
    add_column :tastes, :item_id, :integer
    add_column :tastes, :user_id, :integer
  end
end
