class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.find_by_category(category)
    joins(:categories).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
