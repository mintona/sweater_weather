class Response
  attr_reader :id,
              :status,
              :message,
              :errors

  def initialize(response, errors = nil)
    @id = nil
    @status = response.status
    @message = response.message
    @errors = errors
  end
end
