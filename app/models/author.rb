class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :bio, presence: true
end