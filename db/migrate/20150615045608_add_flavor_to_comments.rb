class AddFlavorToComments < ActiveRecord::Migration
  def change
    add_column :comments, :flavor, :boolean
    add_column :comments, :texture, :boolean
    add_column :comments, :portion, :boolean
    add_column :comments, :aroma, :boolean
    add_column :comments, :visual, :boolean
  end
end
