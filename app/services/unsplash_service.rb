class UnsplashService
  def get_photo(location)
    get_json(location).first[:urls][:regular]
  end

  private

  def conn
    Faraday.new(url: "https://api.unsplash.com/search/") do |faraday|
      faraday.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
      faraday.headers['Accept-Version'] = "v1"
    end
  end

  def get_json(location)
    response = conn.get('photos') do |req|
      req.params['query'] = location
      req.params['orientation'] = 'landscape'
    end
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
