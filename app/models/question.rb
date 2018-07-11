class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validate :validate_answers_number

  def validate_answers_number
    errors.add(:base) if (1..4).include?(answers.count)
  end
end
