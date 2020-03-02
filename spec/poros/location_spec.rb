require 'rails_helper'

RSpec.describe Location do
  before :each do
    location_data = File.read('spec/fixtures/denver_location.json')
    parsed_location = JSON.parse(location_data, symbolize_names: true)[:results].first
    @location = Location.new(parsed_location)
  end
  
  it 'exists with attributes' do
    expect(@location).to be_a Location
    expect(@location.city).to eq("Denver")
    expect(@location.state).to eq("CO")
    expect(@location.country).to eq("United States")
    expect(@location.latitude).to eq(39.7392358)
    expect(@location.longitude).to eq(-104.990251)
  end

  describe "instance methods" do
    describe "#city_state" do
      it "returns a string of city, state abbreviation" do
        expect(@location.city_state). to eq("Denver, CO")
      end
    end

    describe "#coordinates" do
      it "returns a string of latitude,longitude" do
        expect(@location.coordinates).to eq("39.7392358,-104.990251")
      end
    end
  end
end
