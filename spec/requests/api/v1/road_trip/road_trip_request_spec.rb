require 'rails_helper'

describe "Road trip API" do
  describe 'endpoints' do
    VCR.turn_off! :ignore_cassettes => true
    WebMock.allow_net_connect!

    it 'retrieves the travel time and arrival forecast for a given trip' do
      user = User.create!(email: "myemail@gmail.com",
                          password: "password",
                          password_confirmation: "password")

      params = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": "#{user.api_key}"
                }

      post '/api/v1/road_trip', params: params

      expect(response.status).to eq(201)

      trip_info = JSON.parse(response.body)['data']

      expect(trip_info).to have_key('id')
      expect(trip_info).to have_key('attributes')
      expect(trip_info['attributes']).to have_key('origin')
      expect(trip_info['attributes']).to have_key('destination')
      expect(trip_info['attributes']).to have_key('travel_time')
      expect(trip_info['attributes']).to have_key('arrival_forecast')
      expect(trip_info['attributes']['arrival_forecast']).to have_key('temperature')
      expect(trip_info['attributes']['arrival_forecast']).to have_key('summary')
    end
  end
  ##sad path
end
