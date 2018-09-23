class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    render inline: \
      "<h1>All questions of test <%= @test.title %></h1>\n"\
      "<p><a href='<%= tests_path %>'>Back to all tests list</a></p>\n"\
      "<p><table><tbody>\n<tr><th>Body</th><th>Delete</th></tr>\n"\
      "<% @test.questions.each do |question| %>"\
      "<tr><td><a href='<%= question_path(question.id) %>'><%= question.body %></a></td>"\
      "<td><%= button_to 'Delete', question_path(question.id), :method => :delete %></td></tr>\n"\
      "<% end %>"\
      "</tbody></table></p>\n"\
      "<p><a href='<%= new_test_question_path %>'>Create new question for test <%= @test.title %></a></p>"
  end

  def show
    render inline: \
      "<h1>Question <%= params[:id] %></h1>\n"\
      "<p><a href='<%= tests_path %>'>Back to all tests list</a></p>\n"\
      "<p><table><tbody>\n<tr><th>Body</th><th>Delete</th></tr>\n"\
      "<% question = Question.find(params[:id]) %>"\
      "<tr><td><a href='<%= question_path(question.id) %>'><%= question.body %></a></td>"\
      "<td><%= button_to 'Delete', question_path(question.id), :method => :delete %></td></tr>\n"\
      "</tbody></table></p>\n"
  end

  def new
  end

  def create
    params[:question][:test_id] = params[:test_id]
    question = Question.create!(params.require(:question).permit(:body, :test_id))
    redirect_to test_path(params[:test_id])
  end

  # def edit
  # end

  # def update
  #   render plain: params.inspect
  # end

  def destroy
    Question.find(params[:id]).destroy!
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_record_not_found
    render inline: \
      "<h1>Question was not found</h1>\n"\
      "<p><a href='<%= tests_path %>'>Back to all tests list</a></p>\n"\
      "<p>Question was not found</p>"
  end
end
