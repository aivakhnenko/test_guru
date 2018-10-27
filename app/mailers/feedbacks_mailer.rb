class FeedbacksMailer < ApplicationMailer
  def feedback(params)
    @user = params[:user]
    @email = params[:email]
    @title = params[:title]
    @text = params[:text]
    mail to: TestGuru::Application::ADMIN_EMAIL, subject: 'New feedback from TestGuru'
  end
end
