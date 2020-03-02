class Api::V1::MunchiesController < ApplicationController
  def show
    munchie = MunchieFacade.new(params['start'], params['end'], params['food'])
    render json: MunchieSerializer.new(munchie)
  end
end
