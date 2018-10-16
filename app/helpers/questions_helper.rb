module QuestionsHelper
  def question_header(question)
    I18n.t(question.new_record? ? 'helper.questions.header_new' : 'helper.questions.header_edit', title: question.test.title)
  end
end
