class ApplicationController < ActionController::API
  private
  def parse(text)
    text = '' unless text
    # 空白の除去
    text.gsub!(/\s/, '')

    # macabで解析
    mecab = Natto::MeCab.new(dicdir: ENV['MECAB_DIC_DIR'])
    result = []
    mecab.parse(text) do |note|
      if note.surface.presence
        result << [note.surface, note.feature.split(',')]
      end
    end
    return result
  end
  def coloring_text(text)
    result = ''

    counter = 0
    parse(text).each do |word|
      find = text.index(word[0], counter)
      p "*** #{word[0]} (#{find})"
      result += text[counter...find] + coloring_word(word)
      counter = find + word[0].length
    end
    return "#{result}"
  end
  def coloring_word(word)
    surface = word[0]
    feature = word[1]

    result = surface

    if feature[0] == '名詞' && feature[1] == '固有名詞' && feature[2] == '人名'
      result = "<font color='#d9534f'>#{surface}</font>"
    elsif feature[0] == '名詞' && feature[1] == '固有名詞' && feature[2] == '地域'
      result = "<font color='#5cb85c'>#{surface}</font>"
    elsif feature[0] == '名詞' && feature[1] == '固有名詞' && feature[2] == '組織'
      result = "<font color='#5bc0de'>#{surface}</font>"
    elsif feature[0] == '名詞' && feature[1] == '固有名詞'
      result = "<font color='#428bca'>#{surface}</font>"
    end

    if surface == '株式会社'
      result = "<font color='#f0ad4e'>#{surface}</font>"
    end

    return result
  end
end
