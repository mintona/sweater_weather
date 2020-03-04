class Api::V1::RoadTripController < ApplicationController
  def create
    if params[:api_key].nil? || !User.exists?(api_key: params[:api_key])
      response.status = :unauthorized
      # error = NotSuccessful.new(response)
      # require "pry"; binding.pry
      render json: NotSuccessfulSerializer.new(NotSuccessful.new(response))
      # render json: response.message, status: :unauthorized
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
