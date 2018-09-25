class TestsController < ApplicationController
  def index
    # render plain: Test.all.inspect
    render inline: \
      "<h1>All tests</h1>\n"\
      "<p><table><tbody>\n<tr><th>Title</th><th>Level</th><th>Category</th></tr>\n"\
      "<% Test.all.each do |test| %>"\
      "<tr><td><a href='<%= test_path(test) %>'><%= test.title %></a></td>"\
      "<td><%= test.level %></td>"\
      "<td><%= test.category.title %></td></tr>\n"\
      "<% end %>"\
      "</tbody></table></p>"
  end

  def show
    redirect_to test_questions_path(params[:id])
  end

  # def new
  #   render plain: params.inspect
  # end

  # def create
  #   render plain: params.inspect
  # end

  # def edit
  #   render plain: params.inspect
  # end

  # def update
  #   render plain: params.inspect
  # end

  # def destroy
  #   render plain: params.inspect
  # end
end
