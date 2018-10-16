class Admin::QuestionsController < Admin::BaseController
  before_action :find_question, except: %i[new create]
  before_action :find_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to [:admin, @test], notice: t('.notice_success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question], notice: t('.notice_success')
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!
    redirect_to [:admin, @question.test], notice: t('.notice_success')
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    redirect_to admin_path, alert: t('admin.answers.rescue_with_question_not_found.alert')
  end
end
