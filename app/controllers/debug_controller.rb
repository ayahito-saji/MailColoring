class DebugController < ApplicationController
  def mecab
    text = params[:p]
    mecab = Natto::MeCab.new(dicdir: ENV['MECAB_DIC_DIR'])
    res = mecab.parse(text)
    render plain: res
  end
end