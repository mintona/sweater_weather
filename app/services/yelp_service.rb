class YelpService
  def restaurant_data(type, latitude, longitude, time)
    get_json(type, latitude, longitude, time)
  end

  private

  def conn
    Faraday.new(url: "https://api.yelp.com/v3") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{ENV['YELP_API_KEY']}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(type, latitude, longitude, time)
    response = conn.get('businesses/search') do |req|
      req.params['term'] = type
      req.params['latitude'] = latitude
      req.params['longitude'] = longitude
      req.params['open_at'] = time
      req.params['sorty_by'] = 'rating'
      req.params['limit'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)[:businesses].first
  end
end
