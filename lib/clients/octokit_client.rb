class OctokitClient 
  ROOT_ENDPOINT = "http://octokit.github.io/"
  ACCESS_TOKEN = ENV['OCTOKIT_TOKEN']
  #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

  def initialize
  	@http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request| 
      request.headers["Authorization"] = "token #{ACCESS_TOKEN}"
      request.headers["Content-Type"] = "application/json"
      request.body = params.to_json
    end
  end

  private 

  def setup_http_client 
  	Faraday.new(url: ROOT_ENDPOINT)
  end
end

