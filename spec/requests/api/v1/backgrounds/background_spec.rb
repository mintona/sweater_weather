require 'rails_helper'

RSpec.describe 'Background by city API' do
  describe 'endpoints' do
    it 'returns a background image for a given city' do
      location = "denver,co"

      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_succesful

      image = JSON.parse(response.body)['data']
    end
  end
end
