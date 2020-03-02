require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'endpoints' do
    describe 'successful' do
      # A successful request creates a user and generates a unique api
      # key associated with that user.
      it 'creates a new user and generates and api key' do
          params = {
                      email: "whatever@example.com",
                      password: "password",
                      password_confirmation: "password"
                    }

        post '/api/v1/users', params: params

        expect(response.status).to eq(201)
        expected_body = { "api_key": "some key"}
        actual_body = JSON.parse(response.body)

        expect(actual_body).to eq(expected_body)
      end
    end

    describe 'unsuccessful' do
# An unsuccessful request returns a 400 level status code and body
# with a description of why the request wasn’t successful.
# Potential reasons a request would fail: passwords don’t match,
# email has already been taken, missing a field, etc.
    end
  end
end
