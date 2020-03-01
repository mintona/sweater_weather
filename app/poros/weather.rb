class Weather
  attr_reader :current_conditions
  def initialize(weather_data)
    @current_conditions = weather_data[:currently].except(:nearestStormDistance, :nearestStormBearing, :precipIntensity, :dewPoint, :pressure, :windSpeed, :windGust, :windBearing, :cloudCover, :ozone)
    # @current_conditions = weather_data[:currently]
    @hourly = weather_data[:hourly]
    @hourly_summary = {summary: weather_data[:hourly][:summary], icon: weather_data[:hourly][:icon]}
    @daily = weather_data[:daily]
    @daily_forecast = weather_data[:daily][:data]
  end

  def six_day_forecast
    keys = [:time, :summary, :icon, :precipProbability, :precipType, :temperatureLow, :temperatureHigh]
    @daily_forecast[0..5].map do |day|
      day.select { |k,v| keys.include?(k)}
    end
  end

  def current_temp
    @current_conditions[:temperature]
  end

  def high_temp_today
    six_day_forecast[0][:temperatureHigh]
  end

  def weather_today
    keys = [:summary, :temperatureHigh, :temperatureLow, :icon]
    @daily_forecast.first.select { |k,v| keys.include?(k) }
  end

  def summary_tonight
    @hourly[:data][9][:summary]
  end
end
