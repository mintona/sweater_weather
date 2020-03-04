require 'rails_helper'

RSpec.describe RoadTrip do
  it "exists with attributes" do
    trip_info = {
                  :distance=>{:text=>"114 mi", :value=>184173},
                  :duration=>{:text=>"1 hour 48 mins", :value=>6455},
                  :end_address=>"Pueblo, CO, USA",
                  :end_location=>{:lat=>38.2542053, :lng=>-104.6087488},
                  :start_address=>"Denver, CO, USA",
                  :start_location=>{:lat=>39.7411598, :lng=>-104.9879112}
                }
    road_trip = RoadTrip.new(trip_info)

    expect(road_trip).to be_a RoadTrip
    expect(road_trip.origin).to eq("Denver, CO")
    expect(road_trip.duration).to eq("1 hour 48 mins")
    expect(road_trip.duration_in_seconds).to eq(6455)
    expect(road_trip.destination).to eq("Pueblo, CO")
    expect(road_trip.destination_latitude).to eq(38.2542053)
    expect(road_trip.destination_longitude).to eq(-104.6087488)
  end
end
