module QuestionsHelper
  BODY_SHORT_LENGHT = 25.freeze

  def question_header(question)
    locale_path = question.new_record? ? 'helper.questions.header_new' : 'helper.questions.header_edit'
    I18n.t(locale_path, title: question.test.title)
  end

  def question_body_short(question)
    "#{question.body[0..BODY_SHORT_LENGHT-1]}#{question.body.length > BODY_SHORT_LENGHT ? '...' : ''}"
  end
end
