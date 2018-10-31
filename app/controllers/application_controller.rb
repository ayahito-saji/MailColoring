class ApplicationController < ActionController::API
  private
  def parse(text)
    mecab = Natto::MeCab.new(dicdir: ENV['MECAB_DIC_DIR'])
    result = []
    mecab.parse(text) do |note|
      if note.surface.presence
        result << [note.surface, note.feature.split(',')]
      end
    end
    return result
  end
end
