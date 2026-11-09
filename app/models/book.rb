class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :published_year, presence: true, numericality: { only_integer: true }
end