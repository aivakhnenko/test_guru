class FeedbacksController < ApplicationController
  def new; end

  def create
    mail_feedback
    redirect_to root_path, notice: t('feedbacks.create.notice')
  end

  private

  def mail_feedback
    FeedbacksMailer.feedback(user: current_user.full_name, email: current_user.email, title: params[:title], text: params[:text]).deliver_now
  end
end
