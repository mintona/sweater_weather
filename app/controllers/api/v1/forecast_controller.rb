class Api::V1::ForecastController < ApplicationController

  def show
    coordinates = GoogleGeocodeService.new(params["location"]).location_coordinates
    weather_data = DarkSkyService.new(coordinates)
  end
end
