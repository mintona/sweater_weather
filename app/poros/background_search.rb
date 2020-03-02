class BackgroundSearch
  # def initialize(location)
  #   @location = location
  # end
  def get_background(location)

    location = location.split(',').first

    conn = Faraday.new(url: "https://api.unsplash.com/search/") do |faraday|
      faraday.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
      faraday.headers['Accept-Version'] = "v1"
    end

    response = conn.get('photos') do |req|
      req.params['query'] = location
      req.params['orientation'] = 'landscape'
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)[:results]

    url = parsed_json = JSON.parse(response.body, symbolize_names: true)[:results].first[:urls][:regular]
    background = Background.new(url)
  end
end
