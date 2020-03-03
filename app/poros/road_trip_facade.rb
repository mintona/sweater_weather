class RoadTripFacade
  attr_reader :id,
              :origin,
              :destination

  def initialize(params)
    @id = nil
    @origin = params[:origin]
    @destination = params[:destination]
    @api_key = params[:api_key]
  end

  def travel_time
require "pry"; binding.pry
  end
end
