class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_find_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    count_percents >= 85
  end

  def current_position
    test.questions.where('id < ?', current_question.id).count + 1
  end

  def count_percents
    (correct_questions.to_f / test.questions.count * 100).round
  end

  private

  def correct_answer?(answer_ids)
    return false if no_answers?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def no_answers?(answer_ids)
    answer_ids.nil?
  end

  def next_question
    return test.questions.first unless current_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_find_question
    self.current_question = next_question
  end
end
