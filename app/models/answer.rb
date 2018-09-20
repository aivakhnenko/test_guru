class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :answers_count, inclusion: { in: 1..4 }

  scope :correct, -> { where(correct: true) }

  private

  def answers_count
    question.answers.count + (self.new_record? ? 1 : 0)
  end
end
