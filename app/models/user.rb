class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :tests_created, class_name: "Test"

  def tests_by_level(level)
    Test.joins(:users).where(tests: { level: level }, users: { id: id })
  end
end
