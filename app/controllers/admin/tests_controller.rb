class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = current_user.tests_created.new
  end

  def create
    @test = current_user.tests_created.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: 'Test was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy!
    redirect_to admin_tests_path, notice: 'Test was successfully deleted.'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    redirect_to admin_path, alert: 'Test was not found.'
  end
end