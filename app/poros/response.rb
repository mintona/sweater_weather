class Response
  attr_reader :id,
              :status,
              :message,
              :body

  def initialize(response)
    @id = nil
    @status = response.status
    @message = response.message
    @body = response.body if response.body != ""
  end
end
