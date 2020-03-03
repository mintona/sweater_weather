require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'endpoints' do
    describe 'successful' do
      it 'creates a new user and generates and api key' do
          params = {
                      email: "whatever@example.com",
                      password: "password",
                      password_confirmation: "password"
                    }

        post '/api/v1/users', params: params

        expect(response.status).to eq(201)

        body = JSON.parse(response.body)["data"]["attributes"]

        expect(body).to have_key("api_key")
      end
    end

    describe 'unsuccessful' do
      describe 'mismatched passwords' do
        it 'returns a 401 with description of why request was not successful' do
          params = {
                      email: "whatever@example.com",
                      password: "password",
                      password_confirmation: "doesnnotmatch"
                    }

          post '/api/v1/users', params: params

          expect(response.status).to eq(401)
          expect(response.body).to eq("Password confirmation doesn't match Password")
        end
      end

      describe 'already taken username' do
        it "returns a 401 with description of why request was not successful" do
          user = User.create!(email: "newemail@email.com", password: "password", password_confirmation: "password")

          params = {
                      email: "newemail@email.com",
                      password: "password",
                      password_confirmation: "password"
                    }

          post '/api/v1/users', params: params

          expect(response.status).to eq(401)
          expect(response.body).to eq("Email has already been taken")
        end
      end

      describe 'missing field' do
        it "returns a 401 with description of why request was not successful" do
          params = {
                      email: "newemail@email.com",
                      password: "password",
                      password_confirmation: nil
                    }

          post '/api/v1/users', params: params

          expect(response.status).to eq(401)
          expect(response.body).to eq("Password confirmation can't be blank")

          params = {
                      email: nil,
                      password: "password",
                      password_confirmation: "password"
                    }

          post '/api/v1/users', params: params

          expect(response.status).to eq(401)
          expect(response.body).to eq("Email can't be blank")
        end
      end
    end
  end
end
