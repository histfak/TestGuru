class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  scope :list_in_asc, -> { order(title: :asc) }
end
