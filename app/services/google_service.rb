class GoogleService
  def location_data(location)
    get_json('geocode/json', { address: location })
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api')
  end

  def get_json(url, params)
    response = conn.get(url) do |req|
      req.params = params
      req.params['key'] = ENV['GOOGLE_GEOCODE_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first
  end
end
