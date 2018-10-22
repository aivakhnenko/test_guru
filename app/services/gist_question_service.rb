class GistQuestionService
  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @result = Result.new(@client.create_gist(gist_params))
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.gist_params.description', title: @test.title),
      files: {
        "test-guru-question.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:text)].join("\n")
  end

  class Result
    def initialize(result)
      @result = result
    end

    def success?
      !!url
    end

    def url
      @result.html_url
    end
  end
end
