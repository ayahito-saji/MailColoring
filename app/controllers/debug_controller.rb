class DebugController < ApplicationController
  def neologd
    text = params[:p]
    render json: parse(text)
  end
  def mail_coloring
    text = params[:p]
    render html: coloring_text(text).html_safe
  end
end