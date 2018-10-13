class User < ApplicationRecord
  has_many :test_attempts, dependent: :destroy
  has_many :tests, through: :test_attempts
  has_many :tests_created, class_name: "Test", foreign_key: "author_id"

  devise  :database_authenticatable, 
          :registerable, 
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable, 
          :confirmable
  # :lockable, :timeoutable, :omniauthable

  validates :first_name, :last_name, presence: true
  validates :email, format: { with: /.+@.+\..+/ }

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_attempt(test)
    test_attempts.order(id: :desc).find_by(test: test)
  end
end
