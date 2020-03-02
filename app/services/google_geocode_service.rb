class GoogleGeocodeService
  def location_data(location)
    get_json(location)
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode')
  end

  def get_json(location)
    response = conn.get('json') do |req|
      req.params['address'] = location
      req.params['key'] = ENV['GOOGLE_GEOCODE_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first
  end
end
