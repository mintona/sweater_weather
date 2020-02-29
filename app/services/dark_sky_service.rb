class DarkSkyService
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def weather_data
    conn = Faraday.new(:url => "https://api.darksky.net/forecast/#{ENV['DARK_SKY_KEY']}") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("#{@coordinates}") do |req|
      req.params['exclude'] = "flags,minutely"
    end
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end
end
