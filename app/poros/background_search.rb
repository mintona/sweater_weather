class BackgroundSearch

  def get_background(location)

    location = location.split(',').first

    service = UnsplashService.new
    url = service.get_photo(location)

    background = Background.new(url)
  end
end
