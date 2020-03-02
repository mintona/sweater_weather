class GoogleGeocodeService
  def location_data(location)
    get_json(location)
  end

  def travel_data(start, destination)
    get_travel_json(start, destination)
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api')
  end

  def get_json(location)
    response = conn.get('geocode/json') do |req|
      req.params['address'] = location
      req.params['key'] = ENV['GOOGLE_GEOCODE_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first
  end

  def get_travel_json(start, destination)
    response = conn.get('directions/json') do |req|
      req.params['origin'] = start
      req.params['destination'] = destination
      req.params['key'] = ENV['GOOGLE_GEOCODE_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)[:routes].first[:legs].first
  end
end
