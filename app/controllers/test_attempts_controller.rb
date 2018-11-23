class TestAttemptsController < ApplicationController
  before_action :find_test_attempt, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @test_attempt.accept!(params[:answer_ids])
    
    if @test_attempt.completed?
      mail_finished_test
      achieved_badges = BadgeService.new(@test_attempt).achieved_badges
      current_user.badges.push(achieved_badges)
      redirect_to result_test_attempt_path(@test_attempt), method: :get
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_attempt.current_question).call
    gist = current_user.gists.new(question: @test_attempt.current_question, url: result.url)
    if result.success? && gist.save
      flash[:notice] = t('.success', link: view_context.link_to(t('.link_title'), result.url))
    else
      flash[:alert] = t('.failed')
    end
    redirect_to @test_attempt
  end

  private
  
  def find_test_attempt
    @test_attempt = TestAttempt.find(params[:id])
  end

  def mail_finished_test
    if @test_attempt.completed_successfully
      TestsMailer.completed_test(@test_attempt).deliver_now
    else
      TestsMailer.failed_test(@test_attempt).deliver_now
    end
  end
end
