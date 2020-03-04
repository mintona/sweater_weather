require 'rails_helper'

RSpec.describe 'Background by city API' do
  describe 'endpoints' do

    it 'returns a background image for a given city' do
      json_response = File.read('spec/fixtures/denver_background.json')
      stub_request(:get, "https://api.unsplash.com/search/photos?orientation=landscape&query=denver").
      to_return(status: 200, body: json_response)

      location = "denver,co"

      get "/api/v1/backgrounds?location=#{location}"

      expect(response.successful?).to eq(true)

      background = JSON.parse(response.body)['data']
      expect(background).to have_key("id")
      expect(background).to have_key("type")
      expect(background).to have_key("attributes")

      expect(background["attributes"]["url"]).to eq("https://images.unsplash.com/photo-1546156929-a4c0ac411f47?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjExODM3N30")
    end
  end
end
