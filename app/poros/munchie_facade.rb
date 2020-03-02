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

  def forecast
    trip = get_trip
    current_time = Time.now.to_i
    arrival_time = current_time + trip.duration_in_seconds

    service = DarkSkyService.new
    weather_info = service.get_future_forecast(trip.end_latitude, trip.end_longitude, arrival_time)
    weather = Weather.new(weather_info)
    weather.daily_forecast.first[:summary]
  end

end
