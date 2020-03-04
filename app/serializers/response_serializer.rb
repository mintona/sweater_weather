class ResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :message
end
