class Question < ApplicationRecord
  has_many :answers, dependent: delete_all
  belongs_to :test

  validates :body, presence: true
end
