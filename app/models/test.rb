class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }, uniqueness: true

  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.find_by_category(category)
    joins(:categories).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
