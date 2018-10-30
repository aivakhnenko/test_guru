class FeedbacksMailer < ApplicationMailer
  default to: 'alexander.ivakhnenko@gmail.com'

  def feedback(user:, title:, text:)
    @user = user.full_name
    @email = user.email
    @title = title
    @text = text
    mail subject: 'New feedback from TestGuru'
  end
end
