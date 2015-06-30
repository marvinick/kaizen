class Item < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  has_many :comments, dependent: :destroy


  validates :image, attachment_presence: true
  validates :resource, attachment_presence: true


  has_attached_file :image
  has_attached_file :resource

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
