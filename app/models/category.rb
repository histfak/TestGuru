class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  scope :sorted_by_title, -> { order(title: :asc) }
end
