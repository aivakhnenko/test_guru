class QuestionsController < ApplicationController
  before_action :find_question, except: %i[new create]
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @test
    else
      render :new
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

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = @question ? @question.test : Test.find(params[:test_id])
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
