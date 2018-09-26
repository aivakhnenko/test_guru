module QuestionsHelper
  HEADER = { 'new' => 'Create New', 'edit' => 'Edit' }.freeze

  def question_header(question, action)
    "#{HEADER[action]} #{question.test.title} Question"
  end
end
