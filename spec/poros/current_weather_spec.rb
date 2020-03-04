require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists with attributes' do
    weather_data = {
                    :latitude=>38.2542053,
                    :longitude=>-104.6087488,
                    :timezone=>"America/Denver",
                    :currently=> {
                                   :time=>1583284658,
                                   :summary=>"Clear",
                                   :icon=>"clear-night",
                                   :precipIntensity=>0,
                                   :precipProbability=>0,
                                   :temperature=>54.32,
                                   :apparentTemperature=>54.39,
                                   :dewPoint=>17.59,
                                   :humidity=>0.23,
                                   :pressure=>1011.5,
                                   :windSpeed=>6.31,
                                   :windGust=>9.53,
                                   :windBearing=>38,
                                   :cloudCover=>0.13,
                                   :uvIndex=>0,
                                   :visibility=>10,
                                   :ozone=>332.8
                                 }
                    }

    current_weather = CurrentWeather.new(weather_data)

    expect(current_weather).to be_a CurrentWeather
    expect(current_weather.summary).to eq("Clear")
    expect(current_weather.temperature).to eq(54.32)
  end
end
