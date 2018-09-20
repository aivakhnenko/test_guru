class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :answers_count, inclusion: { in: 1..4 }, on: :update

  private

  def answers_count
    answers.count
  end
end
