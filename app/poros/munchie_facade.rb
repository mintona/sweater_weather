class MunchieFacade
  attr_reader :id
  def initialize(start, destination, food)
    @id = nil
    @start = start
    @destination = destination
    @food = food
  end

  def get_trip
    return @trip if @trip
    service = GoogleGeocodeService.new
    location_info = service.travel_data(@start, @destination)
require "pry"; binding.pry
    @trip = Trip.new(location_info)
  end

  def end_location
    trip = get_trip
    trip.end_address
  end

  def travel_time
    trip = get_trip
    trip.duration
  end

end
