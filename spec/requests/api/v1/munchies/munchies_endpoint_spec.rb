require 'rails_helper'

describe 'Munchies API' do
  describe 'endpoint' do
    it 'returns the end location, travel time, forecast and restaurant for a trip' do
      get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

      expect(response).to be_successful

      result = JSON.parse(response.body)['data']

      expect(result).to have_key('id')
      expect(result).to have_key('type')
      expect(result).to have_key('attributes')

      expect(result['attributes']).to have_key('end_location')
      expect(result['attributes']).to have_key('travel_time')
      expect(result['attributes']).to have_key('forecast')
      expect(result['attributes']).to have_key('restaurant')

      expect(result['attributes']['restaurant']).to have_key('name')
      expect(result['attributes']['restaurant']).to have_key('address')
    end
  end
end
