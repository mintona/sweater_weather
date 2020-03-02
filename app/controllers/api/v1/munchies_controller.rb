class Api::V1::MunchiesController < ApplicationController

  def show
    start = params['start']
    destination = params['end']
    food = params['food']

    travel_time = GoogleGeocodeService.new.travel_data(start, destination)

    munchie = Munchie.new(start, destination, food)
    render json: MunchieSerializer.new(munchie)
require "pry"; binding.pry
  end

end
