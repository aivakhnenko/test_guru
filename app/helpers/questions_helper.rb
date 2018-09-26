module QuestionsHelper
  def question_header(question)
    header_starter = question.new_record? ? 'Create New' : 'Edit'
    "#{header_starter} #{question.test.title} Question"
  end
end
