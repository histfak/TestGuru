class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, uniqueness: true

  def tests_taken_by_level(level)
    tests.by_level(level)
  end
end
