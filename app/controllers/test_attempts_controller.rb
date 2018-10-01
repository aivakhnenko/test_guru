class TestAttemptsController < ApplicationController
  before_action :find_test_attempt, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    @test_attempt.accept!(params[:answer_ids])
    
    if @test_attempt.completed?
      redirect_to result_test_attempt_path(@test_attempt)
    else
      render :show
    end
  end

  private
  
  def find_test_attempt
    @test_attempt = TestAttempt.find(params[:id])
  end
end
