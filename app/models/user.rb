require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_attempts, dependent: :destroy
  has_many :tests, through: :test_attempts
  has_many :tests_created, class_name: "Test", foreign_key: "author_id"
  has_secure_password

  validates :email, format: { with: /.+@.+\..+/ }

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_attempt(test)
    test_attempts.order(id: :desc).find_by(test: test)
  end
end
