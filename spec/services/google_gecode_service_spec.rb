require 'rails_helper'

RSpec.describe GoogleGeocodeService do
  describe 'instance methods' do
    describe '#location_data' do
      it "returns the location data of a given city and state", :vcr => { :re_record_interval => 7.days } do
        location = "denver,co"
        service = GoogleGeocodeService.new
        location_info = service.location_data(location)

        expect(location_info).to be_a Hash
        expect(location_info[:address_components].first).to have_key(:long_name)
        expect(location_info[:address_components].first[:long_name]).to eq("Denver")

        expect(location_info[:address_components][2]).to have_key(:short_name)
        expect(location_info[:address_components][2][:short_name]).to eq("CO")

        expect(location_info[:address_components][3]).to have_key(:long_name)
        expect(location_info[:address_components][3][:long_name]).to eq("United States")

        expect(location_info[:geometry]).to have_key(:location)
        expect(location_info[:geometry][:location]).to have_key(:lat)
        expect(location_info[:geometry][:location]).to have_key(:lng)
        expect(location_info[:geometry][:location][:lat]).to eq(39.7392358)
        expect(location_info[:geometry][:location][:lng]).to eq(-104.990251)

        # expect(location_info[:status]).to eq("OK")
      end

      it "returns nil if location not found", :vcr => { :re_record_interval => 7.days } do
        location = "notaplace"
        service = GoogleGeocodeService.new
        location_info = service.location_data(location)
        expect(location_info).to be_nil
        # expect(location_info[:results]).to eq([])
        # expect(location_info[:status]).to eq("ZERO_RESULTS")
      end
    end
  end
end
