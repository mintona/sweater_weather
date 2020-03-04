class DarkSkyService
  def weather_data_by_location(coordinates)
    get_json("#{coordinates}")
  end

  def get_future_forecast(latitude, longitude, time)
    get_json("#{latitude},#{longitude},#{time}")
  end

  private

  def conn
    conn = Faraday.new(:url => "https://api.darksky.net/forecast/#{ENV['DARK_SKY_KEY']}") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url) do |req|
      req.params['exclude'] = "flags,minutely"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
