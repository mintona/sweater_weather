require 'rails_helper'

RSpec.describe GoogleGeocodeService do
  describe 'instance methods' do
    describe '#location_coordinates' do
      it "returns the coordinates of a given city and state", :vcr do
        location = "denver,co"
        service = GoogleGeocodeService.new(location)
        coordinates = service.location_coordinates

        expect(coordinates).to be_a String
        expect(coordinates).to eq("39.7392358,-104.990251")
      end

      it "handles bad input", :vcr do
        location = "notaplace"
        service = GoogleGeocodeService.new(location)
        coordinates = service.location_coordinates

        expect(coordinates).to be_a String
        expect(coordinates).to eq("invalid location")
      end
    end
  end
end
