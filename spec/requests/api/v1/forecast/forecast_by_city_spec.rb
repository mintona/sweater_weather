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
      expect(forecast['attributes']['forecast_today']).to have_key('summary') #todays summary
      expect(forecast['attributes']['forecast_today']).to have_key('summary_tonight') #tonights summary
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

# require "pry"; binding.pry
      #available data:
      #current weather conditions
      #minute-by-minute forecasts out to one hour
      #hour-by-hour and day-by-day forecasts out to 7 days



# You are required to display the message “Powered by Dark Sky” that links to https://darksky.net/poweredby/ somewhere prominent in your app or service. If attribution isn't for you, email sales@darksky.net for details about white labeling.
      # all the data we need back:
      # Upper Left Box:
      # current conditions:
      #   - City, State
      #   - Country
      #   - time and date
      #   - summary ("Partly Cloudy")
      #   - icon? ((Developers should ensure that a sensible default is defined, as additional values, such as hail, thunderstorm, or tornado, may be defined in the future.))
      #   - current temp (farenhight)
      #   - high temp (farenhight)
      #   - low temp (farenhight)
      #
      # Upper Right Box:
      # Details:
      #   - summary("partly county", same as upper left box)
      #   - today details: "Today: Mostly cloudy until afternoon"
      #   - tonight details "Tonight: Partly cloudy starting tonight, continuing until tomorrow morning" <-- does it come from hourly forecast?
      #   - feels like (farenhight)
      #   - humidity (percentage)
      #   - visibility (miles, 10.00 miles)
      #   - UV index (2 (low))
      #
      # Center Box:
      # Forecast:
      #   - Hourly:
      #     - time in hours (data is for top of the hour)
      #     - temp at that time (farenhight)
      #     - whats the empty box? icon?
      # 5 day forecast:
      #   - day of week
      #   - icon
      #   - precipiation probabilty (precent)
      #   - precipiation type
      #   - low temp (temperatureLow)
      #   - high temp (temperatureHigh)
      #
      #   uses UNIX time
      #   can use exclude blocks: alerts, flags
      #   apparentTemperature: "feels like"
      #   hourly: top of hour
      #   daily: midnight of the day

      #sunny
      #precipiation percent
      #low temp
      #high temp
    end
  end
end
