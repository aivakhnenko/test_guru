class FeedbacksController < ApplicationController
  def new; end

  def create
    feedback_params = params.permit(:title, :text).merge(user: current_user).to_h.symbolize_keys
    FeedbacksMailer.feedback(feedback_params).deliver_now
    redirect_to root_path, notice: t('feedbacks.create.notice')
  end
end
