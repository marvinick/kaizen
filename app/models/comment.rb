class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  validates_presence_of :content, :score

  after_save :calculate_average

  def calculate_average
    a = self.item.average_rating
    self.item.update_attributes(total_average_rating: a)
  end
end
