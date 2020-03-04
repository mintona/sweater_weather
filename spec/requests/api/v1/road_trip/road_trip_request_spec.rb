require 'rails_helper'

describe "Road trip API" do
  describe 'endpoints' do
    VCR.turn_off! :ignore_cassettes => true
    WebMock.allow_net_connect!
    describe 'successful' do
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

    describe 'not successful' do
      describe 'no API key' do
        it 'returns a 401' do
          user = User.create!(email: "myemail@gmail.com",
                              password: "password",
                              password_confirmation: "password")

          params = {
                      "origin": "Denver,CO",
                      "destination": "Pueblo,CO",
                      "api_key": nil
                    }

          post '/api/v1/road_trip', params: params

          expect(response.status).to eq(401)

          json = JSON.parse(response.body)['data']

          expect(json['type']).to eq('not_successful')
          expect(json['attributes']['status']).to eq(401)
          expect(json['attributes']['message']).to eq("Unauthorized")
        end
      end

      describe 'invalid API key' do
        it 'returns a 401' do
          user = User.create!(email: "myemail@gmail.com",
                              password: "password",
                              password_confirmation: "password")

          params = {
                      "origin": "Denver,CO",
                      "destination": "Pueblo,CO",
                      "api_key": "nottherightkey"
                    }

          post '/api/v1/road_trip', params: params

          expect(response.status).to eq(401)

          json = JSON.parse(response.body)['data']

          expect(json['type']).to eq('not_successful')
          expect(json['attributes']['status']).to eq(401)
          expect(json['attributes']['message']).to eq("Unauthorized")
        end
      end
    end
  end
end
