class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      response.status = :unauthorized
      error = "Credentials are bad."
      render json: ResponseSerializer.new(Response.new(response, error))
    end
  end
end
