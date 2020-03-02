class ForecastFacade
  attr_reader :id, :location, :six_day_forecast, :current_temp, :state
  def initialize
    @id = nil
    @location = nil
    @weather = nil
    @six_day_forecast = nil
    @curent_conditions = Hash.new

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
    @current_conditions = @weather.current_conditions
    @current_conditions[:current_temp] = current_temp
    @current_conditions
  end

  def forecast_today
    details = @weather.weather_today
    details[:summary_tonight] = @weather.summary_tonight
    details
  end

  def eight_hour_forecast
    @weather.eight_hours
  end
end
