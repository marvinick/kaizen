class AddScoreToTastes < ActiveRecord::Migration
  def change
    add_column :tastes, :score, :integer, default: 0
  end
end
