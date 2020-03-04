class Response
  attr_reader :id,
              :status,
              :message,
              :body,
              :errors

  def initialize(response, errors = nil)
    @id = nil
    @status = response.status
    @message = response.message
    @body = response.body if response.body != ""
    @errors = errors
  end
end
