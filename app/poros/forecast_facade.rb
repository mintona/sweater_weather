class ForecastFacade
  attr_reader :id, :location
  def initialize
    @id = nil
    @location = nil
  end

  def set_location(location)
    service = GoogleGeocodeService.new
    location_data = service.location_data(location)
    @location ||= Location.new(location_data)
  end

  def country
    @location.country
  end

  def get_forecast(location)
    set_location(location)
    service = DarkSkyService.new
    weather_data = service.weather_data_by_location(@location.coordinates)
    @weather ||= Weather.new(weather_data)
  end

  def current_temp
    @weather.current_temp
  end

  def current_conditions
    @weather.current_conditions
  end

  def forecast_today
    details = @weather.weather_today
    details[:summary_tonight] = @weather.summary_tonight
    details
  end

  def eight_hour_forecast
    @weather.next_eight_hours
  end

  def five_day_forecast
    @weather.next_five_days
  end
end
