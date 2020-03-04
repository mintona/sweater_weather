class ResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :status,
              :message,
              :errors
end
