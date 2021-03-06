class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_next_question

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

  def time_left
    (expires_at - Time.current).to_i
  end

  def time_is_up?
    expires_at < Time.current
  end

  def timer_check_passed?
    test.timer? && time_is_up?
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def set_next_question
    self.current_question = next_question
  end

  def expires_at
    created_at + test.timer.minutes
  end
end
