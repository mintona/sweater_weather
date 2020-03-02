require 'rails_helper'

RSpec.describe Weather do
  before :each do
    weather_info = File.read('spec/fixtures/denver_weather.json')
    parsed_weather = JSON.parse(weather_info, symbolize_names: true)

    @weather = Weather.new(parsed_weather)
  end

  it 'exists' do
    expect(@weather).to be_a Weather
  end

  describe "instance methods" do
    describe "#current_conditions" do
      it "returns the current conditions" do
        current_conditions = @weather.current_conditions

        keys = [
                :time,
                :summary,
                :icon,
                :precipProbability,
                :temperature,
                :apparentTemperature,
                :humidity,
                :uvIndex,
                :visibility
              ]

        expect(current_conditions).to be_a Hash
        expect(current_conditions.keys).to match_array(keys)
        expect(current_conditions[:time]).to eq(1583006534)
        expect(current_conditions[:summary]).to eq("Overcast")
        expect(current_conditions[:icon]).to eq("cloudy")
        expect(current_conditions[:precipProbability]).to eq(0)
        expect(current_conditions[:temperature]).to eq(52.39)
        expect(current_conditions[:apparentTemperature]).to eq(52.39)
        expect(current_conditions[:humidity]).to eq(0.19)
        expect(current_conditions[:uvIndex]).to eq(3)
        expect(current_conditions[:visibility]).to eq(10)
      end
    end

    describe "#weather_today" do
      it "returns the forcast for the day" do
        weather_today = @weather.weather_today

        keys = [
                :summary,
                :temperatureHigh,
                :temperatureLow,
                :icon
              ]
        expect(weather_today).to be_a Hash
        expect(weather_today.keys).to match_array(keys)
        expect(weather_today[:summary]).to eq("Overcast throughout the day.")
        expect(weather_today[:icon]).to eq("cloudy")
        expect(weather_today[:temperatureHigh]).to eq(59.08)
        expect(weather_today[:temperatureLow]).to eq(31.68)
      end
    end

    describe "#next_eight_hours" do
      it "returns the forecast for the next 8 hours" do
        eight_hours = @weather.next_eight_hours

        expect(eight_hours).to be_a Array

        expect(eight_hours.first.keys).to match_array([:time, :icon, :temperature])
        expect(eight_hours.first[:time]).to eq(1583006400)
        expect(eight_hours.first[:icon]).to eq("cloudy")
        expect(eight_hours.first[:temperature]).to eq(52.28)
      end
    end

    describe "#next_five_days" do
      it "returns the forcast for the next 5 days" do
        five_days = @weather.next_five_days
        keys = [
                :time,
                :icon,
                :precipType,
                :precipProbability,
                :temperatureHigh,
                :temperatureLow
              ]
        expect(five_days).to be_a Array

        expect(five_days.count).to eq(5)
        expect(five_days.first.keys).to match_array(keys)
        expect(five_days.first[:time]).to eq(1583046000)
        expect(five_days.first[:icon]).to eq("snow")
        expect(five_days.first[:precipProbability]).to eq(0.5)
        expect(five_days.first[:precipType]).to eq("snow")
        expect(five_days.first[:temperatureHigh]).to eq(52.01)
        expect(five_days.first[:temperatureLow]).to eq(23.76)
      end
    end
  end
end
