require 'rails_helper'

RSpec.describe DarkSkyService do
  describe 'instance_methods' do
    describe '#weather_data_by_location' do
      it "returns the weather data for a given lat/long", :vcr => { :re_record_interval => 7.days } do

        coordinates = "39.7392358,-104.990251"
        service = DarkSkyService.new
        weather_data = service.weather_data_by_location(coordinates)

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
        expect(weather_data[:currently]).to have_key(:visibility)

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

    describe "#get_future_forecast" do
      it 'returns the weather data for a given lat, long and time', :vcr => { :re_record_interval => 7.days } do
        lat = 39.7392358
        lng = -104.990251
        time = 583278688

        service = DarkSkyService.new
        weather_data = service.get_future_forecast(lat,lng,time)

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
        expect(weather_data[:currently]).to have_key(:visibility)

        expect(weather_data[:hourly]).to have_key(:summary)
        expect(weather_data[:hourly]).to have_key(:icon)
        expect(weather_data[:hourly]).to have_key(:data)

        expect(weather_data[:hourly][:data].count).to eq(24)
        expect(weather_data[:hourly][:data].first).to have_key(:time)
        expect(weather_data[:hourly][:data].first).to have_key(:summary)
        expect(weather_data[:hourly][:data].first).to have_key(:icon)
        expect(weather_data[:hourly][:data].first).to have_key(:precipProbability)
        expect(weather_data[:hourly][:data].first).to have_key(:temperature)
        expect(weather_data[:hourly][:data].first).to have_key(:apparentTemperature)

        expect(weather_data[:daily]).to have_key(:data)
        expect(weather_data[:daily][:data].count).to eq(1)
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
