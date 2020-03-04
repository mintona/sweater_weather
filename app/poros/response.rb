class Response
  attr_reader :id,
              :status,
              :message

  def initialize(response)
    @id = nil
    @status = response.status
    @message = response.message
  end
end
