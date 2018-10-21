module QuestionsHelper
  def question_header(question)
    locale_path = question.new_record? ? 'helper.questions.header_new' : 'helper.questions.header_edit'
    I18n.t(locale_path, title: question.test.title)
  end
end
