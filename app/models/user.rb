class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  def taken_by_level(level)
    tests.where(level: level)
  end
end
