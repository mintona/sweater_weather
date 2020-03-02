class Api::V1::MunchiesController < ApplicationController

  def show
    start = params['start']
    destination = params['end']
    food = params['food']

    travel_time = GoogleGeocodeService.new.travel_data(start, destination)

    munchie = MunchieFacade.new(start, destination, food)
    render json: MunchieSerializer.new(munchie)
  end

end
