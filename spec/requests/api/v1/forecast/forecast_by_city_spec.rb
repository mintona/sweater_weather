require 'rails_helper'

describe 'Weather by City API' do
  describe 'endpoints' do
    VCR.turn_off! :ignore_cassettes => true
    WebMock.allow_net_connect!

    it 'returns the weather for a given city' do
      location = "denver,co"

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful

      forecast = JSON.parse(response.body)['data']

      expect(forecast).to have_key('type')
      expect(forecast).to have_key('attributes')

      expect(forecast['attributes']).to have_key('location')
      expect(forecast['attributes']).to have_key('country')

      expect(forecast['attributes']).to have_key('current_conditions')

      expect(forecast['attributes']['current_conditions']).to have_key('time')
      expect(forecast['attributes']['current_conditions']).to have_key('summary')
      expect(forecast['attributes']['current_conditions']).to have_key('icon')
      expect(forecast['attributes']['current_conditions']).to have_key('temperature')
      expect(forecast['attributes']['current_conditions']).to have_key('apparentTemperature')
      expect(forecast['attributes']['current_conditions']).to have_key('humidity')
      expect(forecast['attributes']['current_conditions']).to have_key('uvIndex')
      expect(forecast['attributes']['current_conditions']).to have_key('visibility')

      expect(forecast['attributes']).to have_key('forecast_today')
      expect(forecast['attributes']['forecast_today']).to have_key('summary')
      expect(forecast['attributes']['forecast_today']).to have_key('summary_tonight')
      expect(forecast['attributes']['forecast_today']).to have_key('temperatureHigh')
      expect(forecast['attributes']['forecast_today']).to have_key('temperatureLow')

      expect(forecast['attributes']).to have_key('eight_hour_forecast')
      expect(forecast['attributes']['eight_hour_forecast'].count).to eq(8)
      expect(forecast['attributes']['eight_hour_forecast'].first).to have_key('time')
      expect(forecast['attributes']['eight_hour_forecast'].first).to have_key('temperature')
      expect(forecast['attributes']['eight_hour_forecast'].first).to have_key('icon')

      expect(forecast['attributes']).to have_key('five_day_forecast')
      expect(forecast['attributes']['five_day_forecast'].count).to eq(5)
      expect(forecast['attributes']['five_day_forecast'].first).to have_key('time')
      expect(forecast['attributes']['five_day_forecast'].first).to have_key('icon')
      expect(forecast['attributes']['five_day_forecast'].first).to have_key('precipType')
      expect(forecast['attributes']['five_day_forecast'].first).to have_key('precipProbability')
      expect(forecast['attributes']['five_day_forecast'].first).to have_key('temperatureHigh')
      expect(forecast['attributes']['five_day_forecast'].first).to have_key('temperatureLow')
    end
  end
end
