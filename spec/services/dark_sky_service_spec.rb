require 'rails_helper'

RSpec.describe DarkSkyService do
  describe 'instance_methods' do
    describe '#weather_data' do
      it "returns the weather data for a given lat/long" do
        VCR.turn_off! :ignore_cassettes => true
        WebMock.allow_net_connect!
        
        coordinates = "39.7392358,-104.990251"
        service = DarkSkyService.new(coordinates)
        weather_data = service.weather_data

        expect(weather_data).to be_a Hash
        expect(weather_data).to have_key(:latitude)
        expect(weather_data).to have_key(:longitude)
        expect(weather_data).to have_key(:timezone)
        expect(weather_data).to have_key(:currently)
        expect(weather_data).to have_key(:hourly)
        expect(weather_data).to have_key(:daily)
        expect(weather_data).to have_key(:offset)

        expect(weather_data[:currently]).to have_key(:time)
        expect(weather_data[:currently]).to have_key(:summary)
        expect(weather_data[:currently]).to have_key(:icon)
        expect(weather_data[:currently]).to have_key(:precipProbability)
        expect(weather_data[:currently]).to have_key(:temperature)
        expect(weather_data[:currently]).to have_key(:apparentTemperature)
        expect(weather_data[:currently]).to have_key(:humidity)
        expect(weather_data[:currently]).to have_key(:uvIndex)

        expect(weather_data[:hourly]).to have_key(:summary)
        expect(weather_data[:hourly]).to have_key(:icon)
        expect(weather_data[:hourly]).to have_key(:data)

        expect(weather_data[:hourly][:data].count).to eq(49)
        expect(weather_data[:hourly][:data].first).to have_key(:time)
        expect(weather_data[:hourly][:data].first).to have_key(:summary)
        expect(weather_data[:hourly][:data].first).to have_key(:icon)
        expect(weather_data[:hourly][:data].first).to have_key(:precipProbability)
        expect(weather_data[:hourly][:data].first).to have_key(:temperature)
        expect(weather_data[:hourly][:data].first).to have_key(:apparentTemperature)

        expect(weather_data[:daily]).to have_key(:summary)
        expect(weather_data[:daily]).to have_key(:icon)
        expect(weather_data[:daily]).to have_key(:data)

        expect(weather_data[:daily][:data].count).to eq(8)
        expect(weather_data[:daily][:data].first).to have_key(:time)
        expect(weather_data[:daily][:data].first).to have_key(:summary)
        expect(weather_data[:daily][:data].first).to have_key(:icon)
        expect(weather_data[:daily][:data].first).to have_key(:precipProbability)
        expect(weather_data[:daily][:data].first).to have_key(:precipType)
        expect(weather_data[:daily][:data].first).to have_key(:temperatureHigh)
        expect(weather_data[:daily][:data].first).to have_key(:temperatureLow)
        expect(weather_data[:daily][:data].first).to have_key(:precipType)


      end
    end
  end
end
