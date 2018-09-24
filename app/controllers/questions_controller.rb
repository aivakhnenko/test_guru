class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    # render plain: @test.questions.inspect
    render inline: \
      "<h1>All questions of test <%= @test.title %></h1>\n"\
      "<p><a href='<%= tests_path %>'>Back to all tests list</a></p>\n"\
      "<p><table><tbody>\n<tr><th>Body</th><th>Delete</th></tr>\n"\
      "<% @test.questions.each do |question| %>"\
      "<tr><td><a href='<%= question_path(question) %>'><%= question.body %></a></td>"\
      "<td><%= button_to 'Delete', question_path(question), :method => :delete %></td></tr>\n"\
      "<% end %>"\
      "</tbody></table></p>\n"\
      "<p><a href='<%= new_test_question_path %>'>Create new question for test <%= @test.title %></a></p>"
  end

  def show
    # render plain: @question.inspect
    render inline: \
      "<h1>Question <%= @question.id %></h1>\n"\
      "<p><a href='<%= tests_path %>'>Back to all tests list</a></p>\n"\
      "<p><table><tbody>\n<tr><th>Body</th><th>Delete</th></tr>\n"\
      "<tr><td><a href='<%= question_path(@question) %>'><%= @question.body %></a></td>"\
      "<td><%= button_to 'Delete', question_path(@question), :method => :delete %></td></tr>\n"\
      "</tbody></table></p>\n"
  end

  def new
  end

  def create
    @test.questions.create!(question_params)
    redirect_to test_path(@test)
  end

  # def edit
  # end

  # def update
  #   render plain: params.inspect
  # end

  def destroy
    @question.destroy!
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_record_not_found
    render inline: \
      "<h1>Question was not found</h1>\n"\
      "<p><a href='<%= tests_path %>'>Back to all tests list</a></p>\n"\
      "<p>Question was not found</p>"
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
