class User < ApplicationRecord
  has_many :test_attempts, dependent: :destroy
  has_many :tests, through: :test_attempts
  has_many :tests_created, class_name: "Test", foreign_key: "author_id"
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

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

  def admin?
    is_a?(Admin)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def get_badges(test_attempt)
    return unless test_attempt.passed_for_the_first_time?
    category = test_attempt.test.category
    level = test_attempt.test.level
    badges.push(*Badge.where(badge_type: 1)) if test_attempt.first_attempt?
    badges.push(*Badge.where(badge_type: 2, category: category)) if category_completed?(category)
    badges.push(*Badge.where(badge_type: 3, level: level)) if level_completed?(level)
  end

  private

  def category_completed?(category)
    Test.where(category: category).count == test_attempts.category(category).passed.pluck(:test_id).count
  end

  def level_completed?(level)
    Test.where(level: level).count == test_attempts.level(level).passed.pluck(:test_id).count
  end
end
