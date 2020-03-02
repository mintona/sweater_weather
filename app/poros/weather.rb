class Weather
  attr_reader :daily_forecast

  def initialize(weather_data)
    @currently = weather_data[:currently]
    @hourly = weather_data[:hourly][:data]
    @daily_forecast = weather_data[:daily][:data]
  end

  def current_conditions
    desired_data = [:time, :summary, :icon, :precipProbability, :temperature, :apparentTemperature, :humidity, :uvIndex, :visibility]
    @currently.select { |k,v| desired_data.include?(k) }
  end

  def weather_today
    desired_data = [:summary, :temperatureHigh, :temperatureLow, :icon]
    @daily_forecast.first.select { |k,v| desired_data.include?(k) }
  end

  def summary_tonight
    @hourly[9][:summary] #<--- this is probably not right
  end

  def next_eight_hours
    desired_data = [:time, :icon, :temperature]
    hours = @hourly[0..7].map do |hour|
      hour.select { |k,v| desired_data.include?(k) }
    end
  end

  def next_five_days
    desired_data = [:time, :icon, :precipType, :precipProbability, :temperatureHigh, :temperatureLow]
    days = @daily_forecast[1..5].map do |day|
      day.select { |k,v| desired_data.include?(k) }
    end
  end
end
