class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_number, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_number
    errors.add(:base, 'you can\'t have less than 1 and more than 4 answers') if question.answers.count > 4
  end
end
