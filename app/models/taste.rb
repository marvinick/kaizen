class Taste < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :comment
  validates_presence_of :score

  after_save :calculate_average


  def calculate_average
    a = self.item.average_rating_taste
    self.item.update_attributes(total_average_rating: a)
  end
end