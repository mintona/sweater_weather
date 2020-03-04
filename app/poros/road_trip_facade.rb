class RoadTripFacade
  attr_reader :id,
              :origin,
              :destination

  def initialize(params)
    @id = nil
    @origin = params[:origin]
    @destination = params[:destination]
    @api_key = params[:api_key]
  end

  def travel_time
    road_trip.duration
  end

  def arrival_time
    current_time = Time.now.to_i
    current_time + road_trip.duration_in_seconds
  end

  def arrival_forecast
    weather_info = dark_sky_service.get_future_forecast(road_trip.destination_latitude, road_trip.destination_longitude, arrival_time)
    CurrentWeather.new(weather_info)
  end

  private

  def road_trip
    @road_trip ||= RoadTrip.new(GoogleService.new.trip_data(@origin, @destination))
  end

  def dark_sky_service
    DarkSkyService.new
  end
end
