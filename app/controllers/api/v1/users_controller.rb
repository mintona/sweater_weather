class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      response.status = :unauthorized
      errors = user.errors.full_messages.to_sentence
      render json: ResponseSerializer.new(Response.new(response, errors))
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
