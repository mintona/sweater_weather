class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :end_location,
              :travel_time,
              :forecast
end
