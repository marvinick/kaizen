class Texture < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  validates_presence_of :score

  after_save :calculate_average

  def calculate_average
    a = self.item.average_rating_texture
    self.item.update_attributes(total_average_rating: a)
  end
end