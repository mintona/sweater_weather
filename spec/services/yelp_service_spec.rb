require 'rails_helper'

RSpec.describe YelpService do
  describe "instance methods" do
    describe "#restaurant_data" do
      VCR.turn_off! :ignore_cassettes => true
      WebMock.allow_net_connect!

      it "returns a restuarant given specific params" do
        type = 'chinese'
        latitude = 38.2542053
        longitude = -104.6087488
        time = 1583178177

        service = YelpService.new
        restaurant_data = service.restaurant_data(type, latitude, longitude, time)

        expect(restaurant_data).to be_a Hash
        expect(restaurant_data).to have_key(:name)
        expect(restaurant_data).to have_key(:is_closed)
        expect(restaurant_data).to have_key(:location)
        expect(restaurant_data[:location]).to have_key(:display_address)
      end
    end
  end
end
