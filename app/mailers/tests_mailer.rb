class TestsMailer < ApplicationMailer
  def completed_test(test_attempt)
    @user = test_attempt.user
    @test = test_attempt.test
    mail to: @user.email
  end

  def failed_test(test_attempt)
    @user = test_attempt.user
    @test = test_attempt.test
    mail to: @user.email
  end
end
