class User < ApplicationRecord
  has_many :test_attempts, dependent: :destroy
  has_many :tests, through: :test_attempts, dependent: :destroy
  has_many :tests_created, class_name: "Test", dependent: :destroy

  def tests_by_level(level)
    tests.where(level: level)
  end
end
