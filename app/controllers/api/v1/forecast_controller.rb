class Api::V1::ForecastController < ApplicationController

  def show
    # coordinates = GoogleGeocodeService.new.location_data(params["location"])
    # weather_data = DarkSkyService.new.weather_data_by_location(coordinates)
    forecast = Forecast.new
    forecast.get_forecast(params["location"])
    render json: ForecastSerializer.new(forecast)
  end
end
