require 'rails_helper'

RSpec.describe Weather do
  before :each do
    weather_info = File.read('spec/fixtures/denver_weather.json')
    parsed_weather = JSON.parse(weather_info, symbolize_names: true)

    @weather = Weather.new(parsed_weather)
  end

  it 'exists' do
    expect(@weather).to be_a Weather
    # expect(weather.six_day_forecast.count).to eq(5)
  end

  describe "instance methods" do
    describe "#six_day_forecast" do
      it "returns specific weather information for following 5 days" do
        six_day_forecast = @weather.six_day_forecast

        expect(six_day_forecast).to be_a Array
        expect(six_day_forecast.count).to eq(6)
        expect(six_day_forecast.first).to have_key(:time)
        expect(six_day_forecast.first).to have_key(:summary)
        expect(six_day_forecast.first).to have_key(:icon)
        expect(six_day_forecast.first).to have_key(:precipProbability)
        expect(six_day_forecast.first).to have_key(:precipType)
        expect(six_day_forecast.first).to have_key(:temperatureLow)
        expect(six_day_forecast.first).to have_key(:temperatureHigh)
      end
    end

    describe "#current_temperature" do
      it "returns the current temperature" do
        current_temp = @weather.current_temp

        expect(current_temp).to eq(52.39)
      end
    end

    describe "#high_temp_today" do
      it "returns the forcasted high temp for today" do
        high_temp = @weather.high_temp_today

        expect(high_temp).to eq(59.08)
      end
    end

    # describe "#low_temp_today" do
    #   it "returns the forcasted high temp for today" do
    #     low_temp = @weather.low_temp_today
    #
    #     expect(low_temp).to eq(31.68)
    #   end
    # end
    #
    # describe "#current_feels_like" do
    #   it "returns current appparent temperature" do
    #     feels_like = @weather.current_feels_like
    #
    #     expect(feels_like)
    #   end
    # end
  end
end
