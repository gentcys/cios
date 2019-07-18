class Menu < ApplicationRecord
  validates :name, presence: true

  belongs_to :restaurant
  has_many :item
end
