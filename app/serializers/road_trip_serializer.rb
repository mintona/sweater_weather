class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin,
             :destination,
             :travel_time,
             :arrival_forecast

  attribute :origin do |object|
    "#{object.origin.split(',').join(', ')}"
  end

  attribute :destination do |object|
    "#{object.destination.split(',').join(', ')}"
  end
end
