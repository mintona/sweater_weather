class RoadTrip
  attr_reader :duration,
              :destination_latitude,
              :destination_longitude,
              :duration_in_seconds

  def initialize(trip_info)
    @origin = trip_info[:start_address]
    @duration = trip_info[:duration][:text]
    @duration_in_seconds = trip_info[:duration][:value]
    @destination = trip_info[:end_address]
    @destination_latitude = trip_info[:end_location][:lat]
    @destination_longitude = trip_info[:end_location][:lng]
  end

  def destination
    format_city_state(@destination)
  end

  def origin
    format_city_state(@origin)
  end

  def format_city_state(original)
    original.split(',')[0..1].join(',')
  end
end
