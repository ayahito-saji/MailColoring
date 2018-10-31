class DebugController < ApplicationController
  def mecab
    text = params[:p]
    mecab = Natto::MeCab.new
    res = mecab.parse(text)
    render plain: res
  end
end