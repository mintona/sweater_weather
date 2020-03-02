class Location
  attr_reader :city,
              :state,
              :country,
              :latitude,
              :longitude

  def initialize(location_data)
    @city = location_data[:address_components].first[:long_name]
    @state = location_data[:address_components][2][:short_name]
    @country = location_data[:address_components][3][:long_name]
    @latitude = location_data[:geometry][:location][:lat]
    @longitude = location_data[:geometry][:location][:lng]
  end

  def city_state
    "#{city}, #{state}"
  end

  def coordinates
    "#{latitude},#{longitude}"
  end
end
