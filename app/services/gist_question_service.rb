class GistQuestionService
  attr_reader :response

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @response = @client.create_gist(gist_params)
  end

  def success?
    @response&.html_url.present?
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist', title: @test.title),
      public: false,
      files: {
        'test-guru-question.txt' => { content: gist_content
        }
      }
    }
  end

  def default_client
    Octokit::Client.new(access_token: ENV['GIST_TOKEN'])
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
