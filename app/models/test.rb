class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than_or_equal_to: 0 }

  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }).order(title: :desc) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
end
