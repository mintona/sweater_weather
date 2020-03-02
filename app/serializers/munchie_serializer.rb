class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :end_location
end
