class BadgeService
  def initialize(test_attempt)
    @test_attempt = test_attempt
    @user = test_attempt.user
    @test = test_attempt.test
  end

  def achieved_badges
    return [] unless passed_successfully_for_the_first_time?
    Badge.all.select { |badge| badge_valid?(badge) }
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
    send("badge_type_#{badge.badge_type}_valid?".to_sym, badge)
  end

  def badge_type_one_attempt_valid?(badge)
    TestAttempt.where(user: user, test: test).count == 1
  end

  def badge_type_category_valid?(badge)
    category = badge.category
    Test.where(category: category).count == user.test_attempts.category(category).passed.distinct.count(:test_id)
  end

  def badge_type_level_valid?(badge)
    level = badge.level
    Test.where(level: level).count == user.test_attempts.level(level).passed.distinct.count(:test_id)
  end
end
