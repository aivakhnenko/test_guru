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
      redirect_to result_test_attempt_path(@test_attempt)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_attempt.current_question).call
    url = result.html_url
    gist = current_user.gists.new(question: @test_attempt.current_question, url: url)
    if gist.save!
      flash_options = { notice: t('.success', link: "<a href='#{url}'>#{t('.link_title')}</a>") }
    else
      flash_options = { notice: t('.failed') }
    end
    redirect_to @test_attempt, flash_options
  end

  private
  
  def find_test_attempt
    @test_attempt = TestAttempt.find(params[:id])
  end

  def mail_finished_test
    if @test_attempt.completed_successfully?
      TestsMailer.completed_test(@test_attempt).deliver_now
    else
      TestsMailer.failed_test(@test_attempt).deliver_now
    end
  end
end
