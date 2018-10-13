class TestAttemptsController < ApplicationController
  before_action :find_test_attempt, only: %i[show update result]

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
