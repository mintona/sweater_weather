class GoogleGeocodeService
  def initialize(location)
    @location = location
  end

  def location_coordinates
    parsed_response = location_json
    lat = parsed_response[:results].first[:geometry][:location][:lat]
    lng = parsed_response[:results].first[:geometry][:location][:lng]
    "#{lat},#{lng}"
  end

  private

  def response
    Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@location}&key=#{ENV['GOOGLE_GEOCODE_KEY']}")
  end

  def location_json
    JSON.parse(response.body, symbolize_names: true)
  end
end
