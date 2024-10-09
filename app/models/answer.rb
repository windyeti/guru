class Answer < ApplicationRecord
  MAX_ANSWERS_OF_QUESTION = 4

  belongs_to :question, inverse_of: :answers

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_count_answers_question, on: :create

  def validate_count_answers_question
    count = question.answers.count
    errors.add(:count_answers_question, "Count answers must be in 1..4") if count >= MAX_ANSWERS_OF_QUESTION
  end
end
