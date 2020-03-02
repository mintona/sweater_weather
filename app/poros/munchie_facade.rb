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
    get_trip.end_address
  end

  def travel_time
    get_trip.duration
  end

  def arrival_time
    current_time = Time.now.to_i
    current_time + get_trip.duration_in_seconds
  end

  def forecast
    trip = get_trip
    service = DarkSkyService.new
    weather_info = service.get_future_forecast(trip.end_latitude, trip.end_longitude, arrival_time)
    weather = Weather.new(weather_info)
    weather.daily_forecast.first[:summary]
  end

  def restaurant
    trip = get_trip
    service = YelpService.new
    restaurant_data = service.restaurant_data(@food, trip.end_latitude, trip.end_longitude, arrival_time)
    restaurant = Restaurant.new(restaurant_data)
    restaurant.info
  end
end
