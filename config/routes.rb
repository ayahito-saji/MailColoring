Rails.application.routes.draw do

  scope :v1 do
    get 'debug/mecab', to: 'debug#mecab'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
