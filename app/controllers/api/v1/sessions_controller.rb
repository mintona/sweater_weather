class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      response.status = 200
      render json: { api_key: user.api_key}
    else
      response.status = 401
      response.body = "Credentials are bad."
      render json: response.body
    end
  end
end
