class Api::V1::MunchiesController < ApplicationController

  def show
    start = params['start']
    destination = params['end']
    food = params['food']

    travel_time = GoogleGeocodeService.new.get_travel_time(start, destination)
require "pry"; binding.pry
  end

end
