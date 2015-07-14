class Item < ActiveRecord::Base

  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  has_many :comments, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  def average_rating
    comments.sum(:score) / comments.size
  rescue ZeroDivisionError
    0
  end

  def self.search(search)
    if search
      where(['name LIKE ? OR address LIKE ?', "#{search}", "#{search}"])
    else
      all
    end
  end
end
