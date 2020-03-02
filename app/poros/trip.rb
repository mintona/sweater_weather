class Trip
  attr_reader :duration,
              :end_latitude,
              :end_longitude

  def initialize(trip_info)
    @duration = trip_info[:duration][:text]
    @end_address = trip_info[:end_address]
    @end_latitude = trip_info[:end_location][:lat]
    @end_longitude = trip_info[:end_location][:lng]
  end

  def end_address
    @end_address.split(',')[0..1].join(',')
  end
end
