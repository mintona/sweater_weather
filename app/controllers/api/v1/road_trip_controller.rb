class Api::V1::RoadTripController < ApplicationController
  def create
    if params[:api_key].nil? || !User.exists?(api_key: params[:api_key])
      response.status = :unauthorized
      render json: ResponseSerializer.new(Response.new(response))
    else
      road_trip = RoadTripFacade.new(road_trip_params)
      render json: RoadTripSerializer.new(road_trip), status: :created
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
