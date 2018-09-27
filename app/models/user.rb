class User < ApplicationRecord
  has_many :test_attempts, dependent: :destroy
  has_many :tests, through: :test_attempts
  has_many :tests_created, class_name: "Test", foreign_key: "author_id"

  validates :name, :email, presence: true

  def tests_by_level(level)
    tests.by_level(level)
  end
end
