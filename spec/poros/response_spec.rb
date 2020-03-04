require 'rails_helper'

RSpec.describe Response do
  it "exists with attributes" do
    response = ActionDispatch::Response.new
    response.status = :unauthorized

    new_response = Response.new(response)

    expect(new_response).to be_a Response
    expect(new_response.status).to eq(401)
    expect(new_response.message).to eq("Unauthorized")
    expect(new_response.errors).to eq(nil)
  end

  it "can be created with errors" do
    response = ActionDispatch::Response.new
    response.status = :unauthorized
    error = "This is an error."
    new_response = Response.new(response, error)

    expect(new_response).to be_a Response
    expect(new_response.status).to eq(401)
    expect(new_response.message).to eq("Unauthorized")
    expect(new_response.errors).to eq("This is an error.")
  end
end
