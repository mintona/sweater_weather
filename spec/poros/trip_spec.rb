require 'rails_helper'

RSpec.describe Trip do
  it "exists with attributes" do
    trip_info = {
                  :distance=>{:text=>"114 mi", :value=>184173},
                  :duration=>{:text=>"1 hour 48 mins", :value=>6455},
                  :end_address=>"Pueblo, CO, USA",
                  :end_location=>{:lat=>38.2542053, :lng=>-104.6087488},
                  :start_address=>"Denver, CO, USA",
                  :start_location=>{:lat=>39.7411598, :lng=>-104.9879112}
                }
    trip = Trip.new(trip_info)

    expect(trip).to be_a Trip
    expect(trip.duration).to eq("1 hour 48 mins")
    expect(trip.duration_in_seconds).to eq(6455)
    expect(trip.end_address).to eq("Pueblo, CO")
    expect(trip.end_latitude).to eq(38.2542053)
    expect(trip.end_longitude).to eq(-104.6087488)
  end
end
