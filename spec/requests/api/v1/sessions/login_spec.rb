require 'rails_helper'

RSpec.describe 'Sessions API' do
  describe 'endpoints' do
    describe 'successful login' do
      it 'returns the users api key' do
        user = User.create!(email: "myemail@email",
                            password: "password",
                            password_confirmation: "password")

        params = {
                  email: "myemail@email.com",
                  password: "password"
                }

        post '/api/v1/sessions', params: params

        expect(response.status).to eq(200)

        expected_body = {
                          "api_key": "jgn983hy48thw9begh98h4539h4",
                        }
                        
        expect(response.body).to eq(expected_body)
      end
    end
  end
end
