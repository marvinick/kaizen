class Item < ActiveRecord::Base
  validates_presence_of :name, :gluten
  belongs_to :user
end
