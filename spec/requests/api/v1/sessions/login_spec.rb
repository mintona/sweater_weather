require 'rails_helper'

RSpec.describe 'Sessions API' do
  describe 'endpoints' do
    describe 'successful login' do
      it 'returns the users api key' do
        user = User.create!(email: "myemail@email.com",
                            password: "password",
                            password_confirmation: "password")

        params = {
                  email: "myemail@email.com",
                  password: "password"
                }

        post '/api/v1/sessions', params: params

        expect(response.status).to eq(200)

        parsed_response = JSON.parse(response.body)

        expect(parsed_response).to have_key('api_key')
      end
    end

    describe 'unsuccessful login' do
      describe 'wrong password' do
        it 'returns a 401 status code and error message' do
          user = User.create!(email: "itsme@email.com",
                              password: "password",
                              password_confirmation: "password")

          params = {
                    email: "itsme@email.com",
                    password: "notmypassword"
                  }

          post '/api/v1/sessions', params: params

          expect(response.status).to eq(401)
          expect(response.body).to eq("Credentials are bad.")
        end
      end

      describe 'invalid email' do
        it 'returns a 401 status code and error message' do
          user = User.create!(email: "itsme@email.com",
                              password: "password",
                              password_confirmation: "password")

          params = {
                    email: "noonesemail",
                    password: "password"
                  }

          post '/api/v1/sessions', params: params

          expect(response.status).to eq(401)
          expect(response.body).to eq("Credentials are bad.")
        end
      end

      describe 'missing field' do
        it 'returns 401 status code and error message' do
          user = User.create!(email: "itsme@email.com",
                              password: "password",
                              password_confirmation: "password")

          params = {
                    email: "itsme@email.com",
                    password: nil
                  }

          post '/api/v1/sessions', params: params

          expect(response.status).to eq(401)
          expect(response.body).to eq("Credentials are bad.")

          params = {
                    email: nil,
                    password: "password"
                  }

          post '/api/v1/sessions', params: params

          expect(response.status).to eq(401)
          expect(response.body).to eq("Credentials are bad.")
        end
      end
    end
  end
end
