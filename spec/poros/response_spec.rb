require 'rails_helper'

RSpec.describe Response do
  it "exists with attributes" do
    response = ActionDispatch::Response.new
    response.status = :unauthorized

    not_successful = Response.new(response)

    expect(not_successful).to be_a Response
    expect(not_successful.status).to eq(401)
    expect(not_successful.message).to eq("Unauthorized")
  end
end
