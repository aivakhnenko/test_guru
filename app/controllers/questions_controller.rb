class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def show; end

  def new
    @question = @test.questions.new
    render :edit
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @test
    else
      render :edit
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!
    redirect_to @test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_record_not_found
    render inline: \
      "<h1>Question was not found</h1>\n"\
      "<p><a href='<%= tests_path %>'>Back to all tests list</a></p>\n"\
      "<p>Question was not found</p>"
  end
end
