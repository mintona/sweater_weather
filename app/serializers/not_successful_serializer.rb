class NotSuccessfulSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :message
end
