class BadgeService
  def initialize(test_attempt)
    @test_attempt = test_attempt
    @user = test_attempt.user
    @test = test_attempt.test
  end

  def achieved_badges
    return [] unless passed_successfully_for_the_first_time?
    badges = []
    Badge.find_each { |badge| badges.push(badge) if badge_valid?(badge) }
    badges
  end

  private

  attr_reader :test_attempt, :user, :test

  def passed_successfully_for_the_first_time?
    test_attempt.completed_successfully && passed_times == 1
  end

  def passed_times
    TestAttempt.where(user: user, test: test, completed_successfully: true).count
  end

  def badge_valid?(badge)
    send("validate_badge_type_#{badge.badge_type}".to_sym, badge)
  end

  def validate_badge_type_one_attempt(badge)
    first_attempt?
  end

  def validate_badge_type_category(badge)
    category_completed?(badge)
  end

  def validate_badge_type_level(badge)
    level_completed?(badge)
  end

  def first_attempt?
    TestAttempt.where(user: user, test: test).count == 1
  end

  def category_completed?(badge)
    category = badge.category
    Test.where(category: category).count == user.test_attempts.category(category).passed.distinct.count(:test_id)
  end

  def level_completed?(badge)
    level = badge.level
    Test.where(level: level).count == user.test_attempts.level(level).passed.distinct.count(:test_id)
  end
end
