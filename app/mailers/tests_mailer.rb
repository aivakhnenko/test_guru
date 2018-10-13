class TestsMailer < ApplicationMailer
  def completed_test(test_attempt)
    @user = test_attempt.user
    @test = test_attempt.test
    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end

  def failed_test(test_attempt)
    @user = test_attempt.user
    @test = test_attempt.test
    mail to: @user.email, subject: 'Sorry. You failed the TestGuru test.'
  end
end
