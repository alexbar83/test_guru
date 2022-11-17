class GistQuestionService 
  def initialize(question, client: default_client)
    @question = question 
    @test = @question.test 
    @client = client || GitHubClient.new
  end

  def call 
  	@client.create_gist(gist_params)
  end

  private 

  def gist_params 
  	{ 
  	  discription: t('.discription', title: @test.title), 
  	  files: { 
  	    "test-guru-question.txt" => {
          content: gist_content
  	    }
  	  }
    }
  end

  def gist_content 
  	content = [@question.body]
  	content += @question.answers.pluck(:body)
  	content.join("\n")
  end

  def default_client
    OctokitClient.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
