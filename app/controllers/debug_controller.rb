class DebugController < ApplicationController
  def neologd
    text = params[:p]
    render json: parse(text)
  end
end