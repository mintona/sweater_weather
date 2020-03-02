class YelpService

  def restaurant_data(type, latitude, longitude, time)
    conn = Faraday.new(url: "https://api.yelp.com/v3") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{ENV['YELP_API_KEY']}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get('businesses/search') do |req|
      req.params['term'] = type
      req.params['latitude'] = latitude
      req.params['longitude'] = longitude
      req.params['open_at'] = time
      req.params['sorty_by'] = 'rating'
      req.params['limit'] = 1
    end

    results = JSON.parse(response.body, symbolize_names: true)[:businesses].first
  end
end
