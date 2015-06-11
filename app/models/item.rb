class Item < ActiveRecord::Base
  validates_presence_of :name, :gluten
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  has_many :comments, dependent: :destroy
  has_many :tastes, dependent: :destroy
  has_many :textures, dependent: :destroy
  accepts_nested_attributes_for :tastes
  accepts_nested_attributes_for :textures

  def average_rating
    comments.sum(:score) / comments.size
  rescue ZeroDivisionError
    0
  end

  def average_rating_taste
    tastes.sum(:score) / tastes.size
  rescue ZeroDivisionError
    0
  end

  def average_rating_texture
    tastes.sum(:score) / tastes.size
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
