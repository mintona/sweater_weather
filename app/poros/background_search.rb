class BackgroundSearch
  def get_background(location)
    location = formatted_location(location)
    return @background if @background
    url = UnsplashService.new.get_photo(location)
    @background = Background.new(url)
  end

  def formatted_location(location)
    location.split(',').first
  end
end
