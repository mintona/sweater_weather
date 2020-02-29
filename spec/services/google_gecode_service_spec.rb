require 'rails_helper'

RSpec.describe GoogleGeocodeService do
  describe 'instance methods' do
    describe '#location_coordinates' do
      it "returns the coordinations of a given city and state" do
        location = "denver,co"
        service = GoogleGeocodeService.new(location)
        coordinates = service.location_coordinates

        expect(coordinates).to be_a String
        expect(coordinates).to eq("39.7392358,-104.990251")
      end
    end
  end
end
