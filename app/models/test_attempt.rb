class TestAttempt < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  validates :test, :user, presence: true

  before_validation :before_validation_set_current_question

  scope :passed, -> { where(completed_successfully: true) }
  scope :category, -> (category) { joins(:test).where(tests: { category: category }) }
  scope :level, -> (level) { joins(:test).where(tests: { level: level }) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.completed_successfully = true if !next_question && correct_questions_percentage >= 85
    save!
  end

  def completed?
    current_question.nil?
  end

  def correct_questions_percentage
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  def current_question_index
    test.questions.where('id <= ?', current_question.id).count
  end

  private

  def before_validation_set_current_question
    self.current_question =
      if new_record?
        test.questions.first
      else
        next_question
      end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
