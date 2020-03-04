class ResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :status,
              :message,
              :body
end
