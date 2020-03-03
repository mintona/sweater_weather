class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = RoadTripFacade.new(road_trip_params)
    render json: RoadTripSerializer.new(road_trip), status: :created
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
