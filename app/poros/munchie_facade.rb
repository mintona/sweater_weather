class MunchieFacade
  attr_reader :id
  def initialize(start, destination, food)
    @id = nil
    @start = start
    @destination = destination
    @food = food
  end

  def end_location
    service = GoogleGeocodeService.new
    location_info = service.travel_data(@start, @destination)
    location_info[:end_address]
  end

end
