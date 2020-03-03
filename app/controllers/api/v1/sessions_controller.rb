class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      render json: { api_key: user.api_key}
    else
      response.body = "Credentials are bad."
      render json: response.body, status: :unauthorized
    end
  end
end
