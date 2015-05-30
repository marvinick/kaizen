class AddTotalAverageRatingToItems < ActiveRecord::Migration
  def change
    add_column :items, :total_average_rating, :integer, default: 0
  end
end
