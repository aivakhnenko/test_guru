class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_max_answers_count


  scope :correct, -> { where(correct: true) }

  private
  
  def validate_max_answers_count
    errors.add(:question_id) if question.answers.count > 4
  end
end
