class CurrentWeather
  attr_reader :summary, :temperature
  def initialize(weather_info)
    @summary = weather_info[:currently][:summary]
    @temperature = weather_info[:currently][:temperature]
  end
end
